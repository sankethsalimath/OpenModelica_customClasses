model Pivot_R

  parameter Real distance_1[3] = {0,0,0};
  parameter Real distance_2[3] = {0,0,0};
  parameter Real distance_3[3] = {0,0,0};
  
  parameter Real r_cm[3] = {0,0,0} "distance from frame A to centre of mass";
  parameter Real mass = 0 "Mass of link";
  
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = distance_1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = distance_2)  annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = distance_3)  annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1 annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2 annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3 annotation(
    Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_resolve source annotation(
    Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 22}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a top annotation(
    Placement(visible = true, transformation(origin = {100, 70}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-98, 80}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a side annotation(
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-98, 30}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a bottom annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-98, -40}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body annotation(
    Placement(visible = true, transformation(origin = {-30, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedTranslation.frame_a, fixedTranslation1.frame_a) annotation(
    Line(points = {{-40, 70}, {-48, 70}, {-48, 30}, {0, 30}}));
  connect(fixedTranslation1.frame_a, fixedTranslation3.frame_a) annotation(
    Line(points = {{0, 30}, {-10, 30}, {-10, -20}, {10, -20}}, color = {95, 95, 95}));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-60, -10}, {-48, -10}, {-48, 70}, {-40, 70}}, color = {95, 95, 95}));
  connect(revolute1.frame_a, fixedTranslation.frame_b) annotation(
    Line(points = {{0, 70}, {-20, 70}}, color = {95, 95, 95}));
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
  connect(revolute1.frame_b, top) annotation(
    Line(points = {{20, 70}, {100, 70}}));
  connect(body.frame_a, revolute.frame_b) annotation(
    Line(points = {{-40, -52}, {-60, -52}, {-60, -10}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Line(origin = {-94, -12}, points = {{0, 0}, {0, 0}}), Line(origin = {59.4928, 18.5739}, points = {{40.5, 0}, {-41.5, 0}, {-39.5, 0}}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-56.8791, 84.5307}, points = {{68.5, 0}, {-41.5, 0}, {-39.5, 0}}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-59.9116, -36.3899}, points = {{68.5, 0}, {-41.5, 0}, {-39.5, 0}}, pattern = LinePattern.Dash, thickness = 1), Line(origin = {-100.85, 4.92779}, points = {{66.5, 52}, {34.5, 52}, {4.5, 30}}, pattern = LinePattern.Dash, thickness = 1), Polygon(origin = {-7, 25}, fillColor = {85, 85, 0}, fillPattern = FillPattern.Solid, points = {{-1, -65}, {1, -1}, {-35, 23}, {-33, 37}, {3, 31}, {7, 65}, {21, 65}, {27, 7}, {35, -23}, {11, -65}, {11, -65}, {-1, -65}}), Ellipse(origin = {7, 85}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Ellipse(origin = {-37, 55}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Ellipse(origin = {9, 19}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}}), Ellipse(origin = {-1, -35}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-9, 9}, {9, -9}})}));
end Pivot_R;
