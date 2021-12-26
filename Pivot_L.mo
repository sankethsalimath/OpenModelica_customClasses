model Pivot_L

  parameter Real distance_1[3] = {0,0,0};
  parameter Real distance_2[3] = {0,0,0};
  parameter Real distance_3[3] = {0,0,0};
  
  parameter Real r_cm[3] = {0,0,0} "distance from frame A to centre of mass";
  parameter Real mass = 0 "Mass of link";
  
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = distance_1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = distance_2)  annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = distance_3)  annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2 annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3 annotation(
    Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_resolve source annotation(
    Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-98, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a top annotation(
    Placement(visible = true, transformation(origin = {100, 70}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a side annotation(
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a bottom annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, -70}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body annotation(
    Placement(visible = true, transformation(origin = {-30, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute4 annotation(
    Placement(visible = true, transformation(origin = {10, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedTranslation.frame_a, fixedTranslation1.frame_a) annotation(
    Line(points = {{-40, 70}, {-48, 70}, {-48, 30}, {0, 30}}));
  connect(fixedTranslation1.frame_a, fixedTranslation3.frame_a) annotation(
    Line(points = {{0, 30}, {-10, 30}, {-10, -20}, {10, -20}}, color = {95, 95, 95}));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-60, -10}, {-48, -10}, {-48, 70}, {-40, 70}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, revolute2.frame_a) annotation(
    Line(points = {{20, 30}, {40, 30}}, color = {95, 95, 95}));
  connect(revolute3.frame_a, fixedTranslation3.frame_b) annotation(
    Line(points = {{20, -70}, {10, -70}, {10, -40}}));
  connect(revolute.frame_a, source) annotation(
    Line(points = {{-80, -10}, {-100, -10}}));
  connect(revolute3.frame_b, bottom) annotation(
    Line(points = {{40, -70}, {100, -70}}, color = {95, 95, 95}));
  connect(revolute2.frame_b, side) annotation(
    Line(points = {{60, 30}, {100, 30}}));
  connect(body.frame_a, revolute.frame_b) annotation(
    Line(points = {{-40, -52}, {-60, -52}, {-60, -10}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, revolute4.frame_a) annotation(
    Line(points = {{-20, 70}, {-10, 70}, {-10, 72}, {0, 72}}, color = {95, 95, 95}));
  connect(revolute4.frame_b, top) annotation(
    Line(points = {{20, 72}, {100, 72}, {100, 70}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Polygon(origin = {-2, 8}, fillColor = {85, 85, 0}, fillPattern = FillPattern.Solid, points = {{-18, -88}, {-36, -8}, {-20, 52}, {-24, 86}, {-10, 88}, {-4, 52}, {34, 60}, {36, 48}, {12, 32}, {6, -88}, {-18, -88}, {-18, -88}, {-18, -88}}), Ellipse(origin = {-17, 87}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Ellipse(origin = {27, 61}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Ellipse(origin = {-13, -1}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Ellipse(origin = {-17, 87}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Ellipse(origin = {-9, -73}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Line(origin = {-94, -12}, points = {{0, 0}, {0, 0}}), Line(origin = {-56.5, 0}, points = {{40.5, 0}, {-41.5, 0}, {-39.5, 0}}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {27.6516, 87.5632}, points = {{68.5, 0}, {-41.5, 0}, {-39.5, 0}}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {34.0956, -72.0216}, points = {{68.5, 0}, {-41.5, 0}, {-39.5, 0}}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {19.3122, 55.722}, points = {{78.5, -56}, {24.5, -56}, {6.5, 4}}, pattern = LinePattern.Dash, thickness = 1)}));
end Pivot_L;
