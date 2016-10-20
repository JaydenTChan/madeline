/*
Note: Look at General/globalInit.gml for global variables including state.

How to make a new chapter using this engine:
1. duplicate chapter1Rm.
2. remove chapter1IntroObj, chapter1BackgroundObj and chapter1Part1Obj.
3. duplicate chapter1IntroObj, chapter1BackgroundObj and chapter1Part1Obj.
4. duplicate ch1Part1Background, ch1Part1, initCh1Part1 and ch1Introduction.
5. Edit these duplicated scripts for chapter/part.
6. attach these scripts to the duplicated objects.
7. put new objects into the duplicated room.

Making a new part:
1. duplicate chapter1Part1Obj
2. duplicate ch1Part1
3. edit duplicated ch1Part1 Note: make sure to edit switchToPart in the last case.
4. edit duplicated chapter1Part1Obj to use the editted script.


There should be instructions in each of the scripts for you to change things.

Any chapter with multiple parts will be created by using create_instance()
and using instance_destroy() on the previous object.
For example in chapter1Part1Obj use instance_create(chapter1Part2Obj) and then use
instance_destroy() immediately after.

Any questions let me know!
Also when in doubt make me do it.

- Jayden
*/
