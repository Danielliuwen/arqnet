insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you stretch before working out?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you take dietary supplements?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you track your calorie intake?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it true that it's not a good idea to do the same exercises during each workout session?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Should a personal trainer know all of the medications someone is on?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you get too busy and skip a meal?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Can you lose weight without changing your diet?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you have rest periods between work outs?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you eat a lot of protein?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you like eating vegetables?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you think you're fat?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you lift weights?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you control your carb intake?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Should women lift weights if they don't want to get bulky looking?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is sex considered an exercise?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you eat a meal (or meals) after 9PM?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you consider yourself healthy?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you use free weights?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you need to warm up and cool down when you work out?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it good to have a \"cheat day\" where people can eat whatever they want once a week?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "If you lift weights, do you get bigger muscles?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you train the same body part two days in a row?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it necessary to take dietary supplements?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you have a work out schedule?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No Do you have a gym membership?",2);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",3);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",4);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you strech on a regular basis?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you use machines to exercise?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you work out when you're still sore?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it a good idea to workout with friends or family?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you get less than eight hours of sleep?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you go to the gym daily?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it true that people with diabetes have a harder time losing weight?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No Do you wear a belt during heavy lifting?",2);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",3);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",4);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you think you are overweight?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you lift on an empty stomach?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you know how to work out?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you work out while you're sick?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you use prefer free weights over machines?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Do you think a balanced diet is important?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it true that some people naturally lose weight faster than others?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it safe for obese people to lift weights?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Are supplements necessary to gain positive results?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
insert into question(user_id,content,question_category_id,question_status_id,question_type_id) select 1, "Is it a good idea to workout when feeling mentally stressed?",a.question_category_id,b.question_status_id,c.question_type_id from question_category a, question_status b, question_type c where a.name='Health' and b.name='Approved' and c.name='Multiple Choice';
set @q_id = (select LAST_INSERT_ID() from question limit 1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"Yes",1);
insert into question_choice(question_id,content,choice_order) values(@q_id,"No",2);
