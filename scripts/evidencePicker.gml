/*
Create 3 buttons with the evidence they are portraying inside.
*/

e1 = instance_create(512, 384-128, evidencePickerObj);
e2 = instance_create(512, 384, evidencePickerObj);
e3 = instance_create(512, 384+128, evidencePickerObj);

instance_create(0, 0, evidenceBackObj);

e1.evidence = argument0;
e2.evidence = argument1;
e3.evidence = argument2;

with(textBoxObj){
    instance_destroy();
}
with(messageLogObj){
    instance_destroy();
}
with(saveObj){
    instance_destroy();
}
with(exitObj){
    instance_destroy();
}
with(menuObj){
    instance_destroy();
}

