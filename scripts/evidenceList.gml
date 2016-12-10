totalEvidenceMom = 0;
totalEvidenceDad = 0;
totalEvidenceSelf = 0;
temp = "";

for (i = 0; i < ds_list_size(global.evidence) ; i++){
    temp = ds_list_find_value(global.evidence, i);
    switch (temp){
        case "Mysterious Object":
            totalEvidenceMom+=2;
            totalEvidenceDad+=2;
            totalEvidenceSelf+=2;
            break;
        case "Fearful":
            totalEvidenceDad+=2;
            totalEvidenceMom+=2;
            break;
        case "Threatened":
            totalEvidenceDad += 3;
            break;
        case "We don't talk about Madeline":
            totalEvidenceDad += 2;
            break;
        
        default:
        //Useless evidence have no effect.
            break;
    }
}
