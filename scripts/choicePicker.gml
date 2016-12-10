/*
Create 3 buttons with the evidence they are portraying inside.
*/

if argument_count == 4{
    e1 = instance_create(512, 384-128, choicePickerObj);
    e2 = instance_create(512, 384, choicePickerObj);
    e3 = instance_create(512, 384+128, choicePickerObj);
    e3.choice = argument[3];
}else if (argument_count == 5){
    e1 = instance_create(512, 384-128, choicePickerObj);
    e2 = instance_create(512, 384-64, choicePickerObj);
    e3 = instance_create(512, 384+64, choicePickerObj);
    e5 = instance_create(512, 384+128, choicePickerObj);
    e3.choice = argument[3];
    e5.choice = argument[4];
}else{
    e1 = instance_create(512, 384-64, choicePickerObj);
    e2 = instance_create(512, 384+64, choicePickerObj);
}

e4 = instance_create(0, 0, choiceBackObj);

e1.choice = argument[1];
e2.choice = argument[2];

e4.question = argument[0];


