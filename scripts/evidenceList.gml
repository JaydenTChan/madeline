totalEvidenceMom = 0;
totalEvidenceDad = 0;
temp = "";

for (i = 0; i < ds_list_size(global.evidence) ; i++){
    temp = ds_list_find_value(global.evidence, i);
    switch (temp){
        case "Your mom's eyes widen slightly. She seems unsure how to answer.":
            totalEvidenceMom++;
            break;
        case "I'm not sure; I think dad bought it for her.":
            totalEvidenceDad++;
            break;     
        default:
        //Useless evidence have no effect.
            break;
    }
}
