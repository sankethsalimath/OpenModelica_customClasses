class FourLinksRotational
  parameter Real mass = 0 "Mass of body";
  parameter Real r_cm[3] = {0, 0, 0} "Distance from centre of mass to frame m";
  parameter Real distance_am[3] = {0, 0, 0} "Distance from A revolute joint to M revolute joint";
  parameter Real distance_bm[3] = {0, 0, 0} "Distance from B revolute joint to M revolute joint";
  parameter Real distance_cm[3] = {0, 0, 0} "Distance from C revolute joint to M revolute joint";
  
  parameter String shape = "box";
  Modelica.Mechanics.MultiBody.Parts.Body body_mass(m = mass, r_CM = r_cm) annotation(
    Placement(visible = true, transformation(origin = {-4, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2 annotation(
    Placement(visible = true, transformation(origin = {-12, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1 annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation DIstanceAM(r = distance_am) "Position vector from 'A' revolute to 'M' revolute joints" annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation DistanceBM(r = distance_bm) "Position vector from 'B' revolute to 'M' revolute joints" annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_m annotation(
    Placement(visible = true, transformation(origin = {-10, -100}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {0, 0}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation DistanceCM(r = distance_cm) "Position vector from 'C' revolute to 'M' revolute joints" annotation(
    Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3 annotation(
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_c annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_a annotation(
    Placement(visible = true, transformation(origin = {-100, 50}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(height = 0.01, length = 0.01, shapeType = shape, width = 0.01)  annotation(
    Placement(visible = true, transformation(origin = {-4, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute2.frame_b, DistanceBM.frame_a) "Distance from frame A to frame M" annotation(
    Line(points = {{-2, -30}, {20, -30}, {20, -10}}));
  connect(body_mass.frame_a, revolute2.frame_a) annotation(
    Line(points = {{-14, 6}, {-22, 6}, {-22, -30}}, color = {95, 95, 95}));
  connect(DistanceBM.frame_b, revolute1.frame_a) annotation(
    Line(points = {{40, -10}, {44, -10}, {44, 36}, {14, 36}, {14, 50}, {20, 50}}));
  connect(DIstanceAM.frame_b, revolute.frame_a) annotation(
    Line(points = {{-60, -10}, {-60, 50}}, color = {95, 95, 95}));
  connect(revolute2.frame_a, DIstanceAM.frame_a) annotation(
    Line(points = {{-22, -30}, {-40, -30}, {-40, -10}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, frame_b) annotation(
    Line(points = {{40, 50}, {100, 50}}, color = {95, 95, 95}));
  connect(revolute2.frame_a, frame_m) annotation(
    Line(points = {{-22, -30}, {-10, -30}, {-10, -100}}, color = {95, 95, 95}));
  connect(DistanceCM.frame_a, revolute2.frame_b) annotation(
    Line(points = {{20, -70}, {-2, -70}, {-2, -30}}));
  connect(revolute3.frame_a, DistanceCM.frame_b) annotation(
    Line(points = {{60, -70}, {40, -70}}, color = {95, 95, 95}));
  connect(revolute3.frame_b, frame_c) annotation(
    Line(points = {{80, -70}, {100, -70}}, color = {95, 95, 95}));
  connect(revolute.frame_a, frame_a) annotation(
    Line(points = {{-60, 50}, {-100, 50}}, color = {95, 95, 95}));
  connect(fixedShape.frame_a, body_mass.frame_a) annotation(
    Line(points = {{-14, 26}, {-14, 6}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Line(origin = {-1.13, 46.87}, points = {{1.13246, 51.1325}, {1.13246, -44.8675}, {-0.867544, -50.8675}}, thickness = 1.5), Line(origin = {-50, -30}, points = {{50, 30}, {-50, -30}, {-50, -30}}, thickness = 1.5), Line(origin = {50, -31}, points = {{-50, 31}, {50, -31}, {50, -31}}, thickness = 1.5), Ellipse(origin = {0, 80}, lineColor = {240, 0, 0}, lineThickness = 1.5, extent = {{-8, 8}, {8, -8}}), Ellipse(origin = {-84, -50}, lineColor = {240, 0, 0}, lineThickness = 1.5, extent = {{-8, 8}, {8, -8}}), Ellipse(origin = {80, -50}, lineColor = {240, 0, 0}, lineThickness = 1.5, extent = {{-8, 8}, {8, -8}})}));
end FourLinksRotational;
