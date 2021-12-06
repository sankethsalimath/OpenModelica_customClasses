class WheelSupport

  parameter Real distance_FM[3] = {0, 0, 0};
  parameter Real distance_FA[3] = {0, 0, 0};
  parameter Real vehicle_mass = 0 "Mass of vehicle for rolling force";
  parameter Real rolling_coefficient = 1 "Rolling coefficient";
  parameter Real grade_angle = 0 "Grade angle in degrees";
  parameter Real wheel_dia = 0.1;
  parameter Real wheel_thickness = 0.1;
  

  Modelica.Mechanics.MultiBody.Joints.Revolute revolute annotation(
    Placement(visible = true, transformation(origin = {-64, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1 annotation(
    Placement(visible = true, transformation(origin = {-64, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation Distance_FM(r = distance_FM)  annotation(
    Placement(visible = true, transformation(origin = {-68, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-100, 32}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-98, 42}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {100, -70}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const[3](k = {0, vehicle_mass*rolling_coefficient/4, 0})  annotation(
    Placement(visible = true, transformation(origin = {106, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {1, 0, 0}, phi(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {4, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.VoluminousWheel voluminousWheel(rRim = wheel_dia / 4, rTire = wheel_dia / 2, width = wheel_thickness)  annotation(
    Placement(visible = true, transformation(origin = {32, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(r = {wheel_thickness, 0, 0}, r_CM = {wheel_thickness / 2, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {36, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation Distance_FA(r = distance_FA) annotation(
    Placement(visible = true, transformation(origin = {-32, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product[3] annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Sin sin[3] annotation(
    Placement(visible = true, transformation(origin = {108, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1[3](k = {grade_angle, grade_angle, grade_angle})  annotation(
    Placement(visible = true, transformation(origin = {68, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = 90, animation = false, n = {0, 0, 1}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis)  annotation(
    Placement(visible = true, transformation(origin = {-2, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Force force annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.Force force1 annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Distance_FM.frame_a, revolute.frame_b) annotation(
    Line(points = {{-68, 12}, {-50, 12}, {-50, 32}, {-54, 32}}, color = {95, 95, 95}));
  connect(Distance_FM.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-68, -8}, {-80, -8}, {-80, -70}, {-74, -70}}, color = {95, 95, 95}));
  connect(revolute.frame_a, frame_a) annotation(
    Line(points = {{-74, 32}, {-100, 32}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, frame_b) annotation(
    Line(points = {{-54, -70}, {100, -70}}));
  connect(Distance_FA.frame_a, revolute.frame_b) annotation(
    Line(points = {{-42, 32}, {-54, 32}}, color = {95, 95, 95}));
  connect(Distance_FA.frame_b, revolute2.frame_a) annotation(
    Line(points = {{-22, 32}, {-6, 32}, {-6, 30}}, color = {95, 95, 95}));
  connect(bodyShape.frame_a, revolute2.frame_b) annotation(
    Line(points = {{26, 30}, {14, 30}}, color = {95, 95, 95}));
  connect(sin.y, product.u1) annotation(
    Line(points = {{120, -32}, {126, -32}, {126, -6}, {118, -6}}, color = {0, 0, 127}));
  connect(product.u2, const.y) annotation(
    Line(points = {{118, 6}, {122, 6}, {122, 14}, {92, 14}, {92, 30}, {96, 30}}, color = {0, 0, 127}));
  connect(const1.y, sin.u) annotation(
    Line(points = {{80, -32}, {96, -32}}, color = {0, 0, 127}));
  connect(fixedRotation.frame_a, bodyShape.frame_b) annotation(
    Line(points = {{-12, -10}, {-16, -10}, {-16, 14}, {46, 14}, {46, 30}}, color = {95, 95, 95}));
  connect(voluminousWheel.frame_a, fixedRotation.frame_b) annotation(
    Line(points = {{22, -32}, {14, -32}, {14, -10}, {8, -10}}, color = {95, 95, 95}));
  connect(force.frame_a, bodyShape.frame_b) annotation(
    Line(points = {{60, 0}, {46, 0}, {46, 30}}));
  connect(product.y, force.force) annotation(
    Line(points = {{96, 0}, {64, 0}, {64, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(force.frame_b, fixed.frame_b) annotation(
    Line(points = {{80, 0}, {54, 0}, {54, 70}}, color = {95, 95, 95}));
  connect(force1.frame_a, bodyShape.frame_b) annotation(
    Line(points = {{60, 30}, {46, 30}}, color = {95, 95, 95}));
  connect(const.y, force1.force) annotation(
    Line(points = {{96, 30}, {64, 30}, {64, 42}}, color = {0, 0, 127}, thickness = 0.5));
  connect(fixed.frame_b, force1.frame_b) annotation(
    Line(points = {{54, 70}, {80, 70}, {80, 30}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Rectangle(origin = {50, 0}, fillColor = {109, 109, 109}, fillPattern = FillPattern.VerticalCylinder, extent = {{-30, 80}, {30, -80}}), Polygon(origin = {-10, -11}, fillColor = {217, 217, 217}, fillPattern = FillPattern.Solid, points = {{30, 61}, {-30, 61}, {-30, -61}, {4, -61}, {30, -25}, {30, 39}, {30, 61}}), Ellipse(origin = {-21, 33}, lineColor = {0, 76, 255}, fillColor = {10, 36, 208}, lineThickness = 1.5, extent = {{-13, -13}, {13, 13}}), Ellipse(origin = {-23, -55}, lineColor = {255, 255, 2}, fillColor = {10, 36, 208}, lineThickness = 1.5, extent = {{-13, -13}, {13, 13}}), Line(origin = {-59.51, -55.94}, points = {{35.5099, 3.94478}, {-36.4901, -4.05522}, {-20.4901, -2.05522}}, thickness = 1), Line(origin = {-20, 34}, points = {{0, 28}, {0, -28}, {0, -28}}, thickness = 1), Line(origin = {-23, 32}, points = {{-27, 0}, {27, 0}, {27, 0}}, thickness = 1)}));
end WheelSupport;
