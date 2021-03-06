class RotationalLink
  parameter Real mass = 0 "Mass of body";
  parameter Real r_cm[3] = {0, 0, 0} "Distance from centre of mass to frame m";
  parameter Real distance_am[3] = {0, 0, 0} "Distance from A revolute joint to M revolyte joint";
  parameter Real distance_bm[3] = {0, 0, 0} "Distance from B revolute joint to M revolyte joint";
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
    Placement(visible = true, transformation(origin = {100, 50}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-100, 52}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_m annotation(
    Placement(visible = true, transformation(origin = {-10, -100}, extent = {{-16, -16}, {16, 16}}, rotation = -90), iconTransformation(origin = {2, -100}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
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
  connect(frame_a, revolute.frame_b) annotation(
    Line(points = {{-100, 52}, {-40, 52}, {-40, 50}}));
  connect(revolute2.frame_a, frame_m) annotation(
    Line(points = {{-22, -30}, {-10, -30}, {-10, -100}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Line(points = {{-80, 0}, {80, 0}, {80, 0}}, thickness = 1.5), Line(origin = {-40, -40}, points = {{-40, 40}, {40, -40}, {40, -40}}, thickness = 1.5), Line(origin = {40, -40}, points = {{-40, -40}, {40, 40}, {40, 40}}, thickness = 1.5), Ellipse(origin = {0, -32}, fillColor = {0, 255, 127}, fillPattern = FillPattern.Solid, extent = {{14, -14}, {-14, 14}})}));
end RotationalLink;
