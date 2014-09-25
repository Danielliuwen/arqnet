/**
 * To generate the necessary forms to put in the pop up dialog
 * when DnD an event onto the calendar
 */
var formFactory = {
		
	service:'/createCalendarEvent',
	
	dialogClass:'DndDlg',
	formClass:'DndForm',
	
	/*
	 * A hash of capped event date
	 */
	cappable_event_data:null,
	/*
	 * Tells the form that the event dropped on the calendar is supposed
	 * to cap/finish some other event
	 */
	is_capping_event:null,
	
	onSuccess:function(response)
	{
		
	},
	
	onError:function()
	{
		
	},
	
	/*
	 * Push event to server
	 */
	submit:function(dialog,form,nonFormValues,eventObj,tooltipFields)
	{
		//console.log("SUBMIT",dialog,form,eventObj,tooltipFields);
		if (!eventObj) return;
		var self = this;
		if (!dialog) return;
		//if (!form) return;
		
		var formValues = form?form.serializeArray():null;
		var values = this.createEventValues(formValues,nonFormValues,tooltipFields);
		dialog.dialog('close');
		if (form) form.remove();
		dialog.remove();
		eventObj.description = values;
		eventObj.capping_event=this.is_capping_event?1:0;
		//console.log('EVENT OBJ',eventObj);
		
		var myData = {
			capping_event:this.is_capping_event?1:0,
			start:new Date(eventObj.start).toISOString(),
			end:eventObj.end,
			all_day:eventObj.allDay?1:0,
			definitions:values
		};

		$.ajax({
			url:self.service,
			type:'POST',
			dataType:'json',
			data:myData,
			success:function(response) {
				if ('success' in response && response['success']==1) {
					if (response['calendar_event_id'])
					{
						eventObj['calendar_event_id'] = response['calendar_event_id'];
						eventObj['className'] +=' '+response['calendar_event_id'];
					}
					eventObj['editable'] = false;
					$('#calendar').fullCalendar('renderEvent', eventObj, true);
				} else {
					var msg = 'Unable to create event';
					if ('msg' in response) msg = response['msg'];
					updateMsg($('.myErrorMsg_msg'),msg);
					$('#myErrorMsg').dialog('open');
					setTimeout(function() {$('#myErrorMsg').dialog('close');},2000);
				}
			},
			error:function(err) {
				var msg = 'Unable to create event';
				updateMsg($('.myErrorMsg_msg'),msg);
				$('#myErrorMsg').dialog('open');
				setTimeout(function() {$('#myErrorMsg').dialog('close');},2000);
			}
		});
	},
	
	/*
	 * Creates the tooltip for the created event, as well as the definitions array
	 * to pass back to the create calendar service
	 */
	createEventValues:function(values,nonFormValues,tooltipFields) 
	{
		var formValues = [],
			capping_event_defns = [];
		for (var t = 0;t<tooltipFields.length;t++)
		{
			var name = tooltipFields[t].name,
				label = tooltipFields[t].label,
				units = tooltipFields[t].unit||null;
			for (var v =0;v<values.length;v++) 
			{
				if (values[v].name == name) {
					var tip = label+' '+values[v].value
					if (units) {
						for (u = 0;u<values.length;u++)
						{
							if (values[u].name == name+'_unit') {
								for (var unit=0;unit<units.length;unit++)
								{
									if (units[unit]['event_unit_id'] == values[u].value)
									{
										tip+=' '+units[unit].name;
									}
								}
							}
						}
					}
					formValues.push({value:tip,definition_id:values[v].name});
				}
			}
		}
		for (var i = 0;i<nonFormValues.length;i++)
		{
			formValues.push({value:'Yes',type:'NonForm',definition_id:nonFormValues[i].name});
		}
		
		/*
		 * If there is no input, we can leave
		 */
		if (!values) return formValues;
		/*
		 * This is for capping events
		 */
		for (var i = 0;i<values.length;i++)
		{
			if (values[i].name.match(/cappable_events/))
			{
				var definition_id = values[i].name.replace(/cappable_events_/g,'');
				formValues.push({
					type:'cap_event',
					definition_id:definition_id,
					capped_value:values[i].value,
					value:'That began on ' +$('select[name='+values[i].name+']').find(':selected').text() 
				});
			}
		}
		return formValues;
	},
	
	/* 
	 * Generate the form for this event
	 * If this is a capping event, we must look for
	 * eligible cappable events (i.e., ones that match this type
	 * of capping event, that are not capped already, and that
	 * occur before the date the capping event was dropped onto)
	 */
	create:function(/** {FieldEvents} **/fields,eventObj,dndSource)
	{
		if (dndSource && dndSource.remove) dndSource.remove();
		var self = this;
		this.cappable_event_data = {};
		if (!fields) return null;
		
		if (fields['capping_event']>0) {
			for (var i in fields['labels']) {
				this._getCappableEventData(fields, $.extend(fields['labels'][i],{capping_event:1,start:eventObj.start||null}),function() {
					for (var i in self.cappable_event_data) 
					{
						if (self.cappable_event_data[i].length<=0)
						{
							$('.myErrorMsg_msg').text("There are no events of this type to end");
							$('#myErrorMsg').dialog('open');
							return;
						}
					}
					self.is_capping_event=true;
					self.createAndShowForm(fields, eventObj);
				});
			}
		}	else {
			this.createAndShowForm(fields,eventObj);
		}
		
	},
	
	/*
	 * Generate form and show it
	 */
	createAndShowForm:function(fields,eventObj)
	{
		var self = this;
		if (!fields) return null;
		
		var form,
			dialog = this._createDlg(),
			table = $('.'+this.formClass +' table'),
			rules = {},
			messages = {},
			tooltipFields = [],
			nonFormValues = [],
			formStr = '';
		
		//for (var i = 0;i<fields.length;i++)
		for (var i in fields['labels'])
		{
			if (fields['labels'][i].type == '_no_input_') {
				nonFormValues.push(fields['labels'][i]);
				continue;
			};
			var myField = Fields.createField(fields['labels'][i]);
			if (fields['capping_event']>0) {
				myField = $.extend(myField,{capping_event:1,start:eventObj.start||null});
			}
			tooltipFields.push($.extend({},myField));
			formStr+=this.createFieldRow(myField);
			if (myField.rule) rules[myField.name] = myField.rule;
			if (myField.message) messages[myField.name] = myField.message;
		}			

		//hidden field to tell service that this is a capping event
		if (fields['capping_event']>0) {
			formStr+=this.createCappingEventField();
		}
		
		formStr+=this.createBtnRow();
		
		table.append(formStr);
		

		dialog.dialog({
			autoOpen:false,
			closeOnEscape:false,
			modal:true,
			draggable:true,
			width:433,
			height:220
		});

		table.find('input[value=Cancel]').click(function() {
			dialog.dialog('close');
		});
		/*
		 * If we have input; we have rules, and the form needs to be filled out and
		 * validated before submission
		 * 
		 * Otherwise we can submit directly
		 */
		if (Object.keys(rules).length>0)
		{
			form = $('.'+this.formClass);
			form.validate({
				rules:rules,
				messages:messages,
				submitHandler:function(evt) {
					self.submit(dialog,form,nonFormValues,eventObj,tooltipFields);
				}
			});
			
			dialog.dialog('open');
			
			return dialog;
		} else
		{
			this.submit(dialog,form,nonFormValues,eventObj,tooltipFields);
			return dialog;
		}
	},
	
	/*
	 * Create a row in the form
	 */
	createFieldRow:function(field)
	{
		var row = '<tr height="40">';
		
		
		if (field['type'] && this['create_'+field['type']])
		{
			row+='<td>'+this.createLabel(field.label,field.name)+'</td>';
			row+='<td>'+this['create_'+field['type']](field)+'</td>';
		} else if (field['capping_event']) {
			row+='<td>'+"Which one has ended"+'</td>';
			
			row+='<td>'+"<select name='cappable_events_"+field.name+"' required=true>"+this.createCappingEventDropDown(field)+"</select>"+'</td>';
			row+=this.createHidden(field);
		} else
		{
			row+='<td>'+this.createLabel(field.label,field.name)+'</td>';
			row+='<td>'+this.createInput(field)+'</td>';
		}
		if (field['unit'] && Object.prototype.toString.call( field['unit'] ) === '[object Array]' ) {
			
			row+='<td>'+this.createDropDown(field['name']+'_unit',field['unit'])+'</td>';
		}
		row+='</tr>';
		return row;
	},
	
	/*
	 * The submit button
	 */
	createBtnRow:function()
	{
		var str = '<tr height="40"><td>'+'<input type="submit" value="Submit" /></td>'+
		'<td><input type="button" value="Cancel" /></tr>';
		//str+='<td><input type="button" value="Cancel" class="cancelDnD" /></td></tr>';
		return str;
	},
	
	/*
	 * A label
	 */
	createLabel:function(value,labelFor)
	{
		if (!value) return '';
		var label = '<label ';
		if (labelFor) label+='"for"="'+labelFor+'" >'
		else label+='>';
		label+=value;
		label+='</label>';
		return label
	},
	
	/*
	 * Your run-of-the-mill input field
	 */
	createInput:function(field)
	{
		if (!field) return '';
		var input = '<input name="'+field['name']+'" placeholder="" />';
		return input;
	},
	
	/*
	 * hidden input field
	 */
	createHidden:function(field)
	{
		if (!field) return '';
		return "<input type='hidden' name='"+field['name']+"' />";
	},
	
	/*
	 * radio button
	 */
	create_radio:function(field)
	{
		var str = '';
		for (var i = 0;i<field.values.length;i++)
		{
			str+='<input class="radio_field" type="radio" name="'+field['name']+'" value="'+field.values[i]+'" /><span class="radio_text">'+field.values[i]+'</span>';
		}
		
		return str;
	},
	
	/* 
	 * A capping event field to tell the server that this event is 
	 * ending some starting event
	 */
	createCappingEventField:function() {
		return "<input type='hidden' name='capping_event' value=1 />";
	},
	
	/*
	 * The ajax service to get eligble starting events to cap/finish
	 */
	_getCappableEventData:function(fields,field,callback)
	{
		if (!field.label) return;
		
		var data = {
			cap_date:field.start?field.start.toISOString():(new Date()).toISOString(),
			label:field.label,
			defn_id:field.name
			},
			self = this,
			keys = Object.keys(fields['labels']);
		
		$.ajax({
			url:'/cappableEvents',
			type:'POST',
			dataType:'json',
			data:data,
			success:function(response) {
				if ('success' in response && response['success']>=0) {
					if ('event_values' in response && response['event_values'].length>0) {
						self.cappable_event_data[field.label] = response['event_values'];
					} else 
					{
						self.cappable_event_data[field.label] = [];
					}
				} else  self.cappable_event_data[field.label] = [];
				
				for (var i = 0;i<keys.length;i++)
				{
					if (!self.cappable_event_data[keys[i]])
					{
						self._getCappableEventData(fields, field, keys[i], callback);
						return;
					}
				}
				callback();
				
			},
			error:function(err) {
				console.log('error');
				self.cappable_event_data[field.label] = [];
				for (var i = 0;i<keys.length;i++)
				{
					if (!self.cappable_event_data[keys[i]])
					{
						self._getCappableEventData(fields, field, keys[i], callback);
						return;
					}
				}
				callback();
			}
		});		
	},
	
	/*
	 * The drop down of capable events
	 * These will be dates of eligible, uncapped starting events
	 */
	createCappingEventDropDown:function(field)
	{
		if (!field.label) return;
		var event_values = this.cappable_event_data[field.label],
			selectStr = '';
		for (var i = 0;i<event_values.length;i++)
		{
			//This is going to be a string date
			selectStr+="<option value='"+event_values[i]['event_value_id']+"'>"
			+(new Date(event_values[i]['event_date'])).toDateString()+"</option>";
		}
		return selectStr;
	},
	
	createDropDown:function(name,values)
	{
		if (!values || !values.length || values.length<=0) return '';
		var str = '<select class="event_field" name="'+name+'">';
		
		for (var i = 0;i<values.length;i++)
		{
			str+='<option value="'+values[i].event_unit_id+'">'+values[i].name+'</option>';
		}
		str+='</select>';
		return str;
	},
	
	_createDlg:function()
	{
		var div = $(this.formTemplate,{'class':this.dialogClass});
		$('body').append(div);
		return div;
	},
	
	onCloseDlg:function()
	{
		if ( $('.DndDlg') ) {
			$('.DndDlg').remove();
		}
	},
	
	// Title attribute for items of the calendar views
	_renderTitleTooltip:function (event)
	{
		var exclude = ['_no_input_','boolean','QA: Asked:','QA: Answered:','Note:'];
		//console.log('_render tooltip',event);
		var html = " title='";
		
		if (event && (event.description) )
		{
			for (var i =0;i< event.description.length;i++)
			{
				if (event.capping_event && event.capping_event>0) {
					if (event.description[i] && event.description[i].type && event.description[i].type=='cap_event')
						html+= ""+event.description[i].value||' '+"<br>";
				} else {
					//if (event.description[i].type !='_no_input_')
					if ($.inArray(event.description[i].type,exclude) ==-1)
						html += ""+event.description[i].value||' '+"<br>"; 
				}
			}				

			html+="' ";
		}
		return html;
	},

	formTemplate:[
		'<div title="Describe Your Task/Event" class="DndDlg">',
			'<form class="DndForm">',
			'<fieldset>',
				'<table>',
				'</table>',
			'</fieldset>',
			'</form>',
		'</div>'        
	              ].join(''),
	              
	              
};