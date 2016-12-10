/*
Chapter 3, Part 1

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/

audio_sound_gain(global.snd, 0, 5000);

if (global.cont == 0){
    //Skip if continue so the game state from the loaded game remains intact.
    global.chapter = 5; //Change these to the relevant part/chapter
    global.part = 1;
    global.state = 0;
    
    //Introductory text for this chapter.
    if (checkAction("Her body, covered in glass")){
        msg("We went to the local theme park that day… the House of Mirrors is Maddy's favourite.");
        msg("Sorry...");
        msg("Was her favorite.");
    }else if(checkAction("Her skin, enveloped with bruises")){
        msg( "We went to the river bank that day… our family always picks the spot on the cliff overseeing the river.");
    }else{
        msg( "We went to the carnival that day… Maddy always had a fear of the Lion pit.");
    }
    
    msg("It was unusual to go somewhere on my birthday.");
    msg("We don’t really go out much as a family.");
    msg("I'm sorry. It's really hard to remember.");
    msg("Michael is having difficulty recalling the events. He could use a little priming… You can ask him questions.");
    msg("[c="+string($00FFFF)+"]Press Enter to Continue[/c]");
    
    //Questions to ask Michael & responses
    q1[2] = "Who’s going to be upset?";
    q1[1] = "Keep what?";
    q1[0] = "And what place would that be?";
    
    q2[2] = "Is that all?";
    q2[1] = "Anything else?";
    q2[0] = "Anything Michael, anything you can give me. Even the smallest detail.";
    
    q3[2] = "What was she like on that day?";
    q3[1] = "Do you know why?";
    q3[0] = "What was Mom doing? ";
    
    q4[2] = "Was it… different, on that day?";
    q4[1] = "What was it about?";
    q4[0] = "What was Dad doing?";
    
    //Responses
    a1[2] = "Maddy will. That’s where she is now.";
    a1[1] = "… She gets really upset when I tell people about her. I don't want to make her upset.";
    a1[0] = "It's where I keep… them.";
    
    a2[2] = "Well, I went after her, but I can't remember anything else.";
    a2[1] = "Someone else was there.";
    a2[0] = "There was a mysterious object.";
    
    a3[2] = "A little happier than usual. Maddy and her went for a walk together.";
    a3[1] = "I dunno, she gets kind of sad sometimes when we're with my Dad. He doesn't really like us.";
    a3[0] = "Mom really likes to be left alone. Whenever we go somewhere she always walks away by herself. So maybe that.";
    
    a4[2] = "No. I guess not. He's just like that all the time.";
    a4[1] = "It was something about work again I think… He's always in a bad mood about work.";
    a4[0] = "I don't really remember, but I know he was in a really bad mood that morning.";
    
    //Evidence
    e1[2] = "Dollhouse";
    e1[1] = "Better left alone";
    e1[0] = "Together. Forever.";
    
    e2[2] = "Amnesiac";
    e2[1] = "Lurking Presence";
    e2[0] = "Murder Weapon";
    
    e3[2] = "Maybe it was Mom";
    e3[1] = "Indifferent";
    e3[0] = "Melancholy";
    
    e4[2] = "Unemotional";
    e4[1] = "Temper, Temper";
    e4[0] = "Maybe it was Dad";
    
}



