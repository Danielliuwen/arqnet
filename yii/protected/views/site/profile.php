<link rel="stylesheet" href="assets/css/profile.css">
<script type='text/javascript'>
	var myProfile = <?php echo json_encode($profile);?>;

	$(document).ready(function() {
		if (!myProfile) return;

		for (var i in myProfile) {
			var field = $('[name='+i+']');
			if (field && field.length>0) {
				console.log(i,field);
				if (myProfile[i] != null) {
					field.val(myProfile[i]);
				}
			}
		}

		if (myProfile['orientation_id']) {
			field = $('[name=orientation][value='+myProfile['orientation_id']+']');
			if (field && field.length>0) {
				field.attr('checked',true);
			}
		}

		if (myProfile['relationship_status_id']) {
			field = $('[name=relationship_status][value='+myProfile['relationship_status_id']+']');
			if (field && field.length>0) {
				field.attr('checked',true);
			}
		}
		
	});
</script>
	<div class="row col-sm-8">
		
		<div class="row">
			
				<!-- tabs for the profile links -->
				<div class='panel panel-primary'  data-collapsed='0'>
					<div class="panel-heading">
						<div class="panel-options" style='float:left;'>
							<ul class="nav nav-tabs">
								<li class="active" ><a href="#myProfile" data-toggle="tab">Profile</a></li>
								<li><a href="#aboutMe" data-toggle="tab">About Me</a></li>
							</ul>
						</div>
					</div>
					<div class='panel-body'>
					<div class="tab-content">
						<div class="tab-pane active" id='myProfile'>
							<form id='myProfileForm' method='post'>
								<div class='col-sm-4'>
									<div class='form-group'>
										<h3>First Name</h3>
										<input placeHolder='First name' name='first_name'></input>
										<h3>Gender</h3>
										<input type='radio' name='gender' value='Female' /><label class='_radio' for='gender'>Female</label>
										<input type='radio' name='gender' value='Male' /><label class='_radio' for='gender'  >Male</label>
										<h3>Birthdate</h3>
										<input placeHolder='Birthday' name='birthday'></input>
										<h3>Facebook URL</h3>
										<input placeHolder='URL' name='facebook_url'></input>
										<h3>Ethnicity</h3>
										<input placeHolder='Ethnicity' name='ethnicity'></input>
										
									</div>
									<div class='form-group'>
										<input type='submit' value='submit' />
									</div>
								</div>
								<div class='col-sm-4'>
									<div class='form-group'>
										<h3>Last Name</h3>
										<input placeHolder='Last name' name='last_name'></input>
										<h3>Relationship</h3>
											<?php 
												if ($relationships) {
													foreach ($relationships as $o) {
														echo "<div class='form-group'><input type='radio' name='relationship_status' value='".$o{'id'}."' /><label class='_radio'>".$o{'description'}."</label></div>";
													}
												}
											?>
										<h3>Location</h3>
										<input placeHolder='Location' name='location'></input>
										<h3>Twitter URL</h3>
										<input placeHolder='URL' name='twitter_url'></input>
									</div>			
								</div>
								<div class='col-sm-4'>
								
									<div class='form-group'>
										<h3>Username</h3>
										<input placeHolder='Username' name='username'></input>
										<h3>Orientation</h3>
											<?php 
												if ($orientations) {
													foreach ($orientations as $o) {
														echo "<div class='form-group'><input type='radio' name='orientation' value='".$o{'id'}."' /><label class='_radio'>".$o{'description'}."</label></div>";
													}
												}
											?>
										<h3>Occupation</h3>
										<input placeHolder='Occupation' name='occupation'></input>
										<h3>Google+ URL</h3>
										<input placeHolder='URL' name='gplus_url'></input>
									</div>										
								</div>
							</form>
						</div>
						<div class="tab-pane" id='aboutMe'>
							<form id='aboutMeForm' method='post'>
								<div class='col-sm-4'>
									<div class='form-group'>
										<h4>Interests:</h4>
										<textarea name='interests'></textarea>
										<h4>Favorite Books:</h4>
										<textarea name='books'></textarea>
										<h4>Website/Blog:</h4>
										<textarea name='blog'></textarea>
									</div>
									<div class='form-group'>
										<input type='submit' value='submit' />
									</div>
								</div>
								<div class='col-sm-4'>
									<div class='form-group'>
										<h4>Favorite Music:</h4>
										<textarea name='music'></textarea>
										<h4>Favorite TV:</h4>
										<textarea name='tv'></textarea>
									</div>			
								</div>
								<div class='col-sm-4'>
								
									<div class='form-group'>
										<h4>Favorite Movies:</h4>
										<textarea name='movies'></textarea>
										<h4>Favorite Quotes:</h4>
										<textarea name='quotes'></textarea>
									</div>										
								</div>
							</form>
						</div>
					</div>
					</div>
			</div>
		</div>



<!-- Footer -->
<footer class="main">
	
		
	&copy; 2014 <strong>ArQnet</strong> Prototype <a>V 1.0</a>
	
</footer>
	</div>
	




	
	

