{  //start script
	app.beginUndoGroup("foo");

	// create project if necessary
	var proj = app.project;
	if(!proj) proj = app.newProject();

	// create new comp named 'my comp'
	var compW = 1920; // comp width
	var compH = 1080; // comp height
	var compL = 100;  // comp length (seconds)
	var compRate = 24; // comp frame rate
	var compBG = [0/255,0/255,0/255] // comp background color
	var myItemCollection = app.project.items;
	var myComp = myItemCollection.addComp('my comp',compW,compH,1,compL,compRate);
	myComp.bgColor = compBG;

	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 480.0, 490.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 480.0, 500.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 480.0, 510.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 490.0, 480.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 490.0, 490.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 490.0, 500.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 490.0, 510.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 490.0, 520.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 470.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 480.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 480.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 480.0,470.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 480.0,490.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 480.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 490.0,440.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 490.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 490.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 490.0,470.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 490.0,490.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 490.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 490.0,510.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,430.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,440.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,470.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,480.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,490.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 500.0,510.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,440.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,470.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,480.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,490.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,510.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 510.0,520.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,440.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,480.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,490.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,510.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,520.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 500.0, 520.0,530.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 480.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 490.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 490.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 500.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 500.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 510.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 510.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 510.0, 520.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 530.0, 460.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 530.0, 470.0,390.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 530.0, 470.0,620.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 530.0, 480.0,370.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 530.0, 480.0,380.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 530.0, 480.0,620.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 530.0, 480.0,630.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 540.0, 450.0,390.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 540.0, 450.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 540.0, 460.0,390.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 540.0, 460.0,400.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 540.0, 460.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 540.0, 470.0,390.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 540.0, 470.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 430.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 440.0,420.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 440.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 440.0,590.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 450.0,420.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 450.0,590.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 460.0,400.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 460.0,410.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 460.0,590.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 460.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 470.0,400.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 470.0,410.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 470.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 550.0, 470.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 440.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 450.0,420.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 450.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 450.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 460.0,410.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 460.0,420.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 460.0,560.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 460.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 470.0,420.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 560.0, 470.0,430.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 430.0,540.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 430.0,550.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 440.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 440.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 440.0,540.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 440.0,550.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 450.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 450.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 450.0,540.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 450.0,550.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 450.0,560.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,470.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,480.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,490.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,500.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,510.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,520.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,530.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,540.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 460.0,560.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,430.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,440.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,450.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,460.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,470.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,480.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,510.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,520.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 570.0, 470.0,540.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 580.0, 460.0,530.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 580.0, 470.0,520.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 580.0, 470.0,530.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 580.0, 470.0,540.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 360.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 360.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 360.0,590.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 360.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 360.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 370.0,560.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 370.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 370.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 370.0,590.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 370.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 370.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 380.0,560.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 380.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 380.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 380.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 380.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 380.0,620.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 390.0,560.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 390.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 390.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 390.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 390.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 390.0,620.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 400.0,560.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 400.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 400.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 400.0,590.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 400.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 400.0,610.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 410.0,570.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 410.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 410.0,590.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 410.0,600.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 420.0,580.0]);
	var solid = myComp.layers.addSolid([1.0, 1.0, 0], "my square", 50, 50, 1);
	solid.threeDLayer=true;

	var p = solid.property("position");

		p.setValueAtTime(0, [ 620.0, 420.0,590.0]);
	myComp.layers.addCamera("Camera 1", [960,540]);

	app.endUndoGroup();
}  //end script
