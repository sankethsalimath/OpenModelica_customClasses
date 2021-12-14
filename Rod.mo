class Rod
  parameter Real m "mass";
  parameter Real r "vector from frame a to frame b";
  parameter Real r_CM "vector from frame a to CG";
  parameter Real I_11=0.001;
  parameter Real I_21=0.001;
  parameter Real I_22=0.001;
  parameter Real I_31=0;
  parameter Real I_32=0;
  parameter Real I_33=0;
  
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(I_11 = I_11, I_21 = I_21, I_22 = I_22, I_31 = I_31, I_32 = I_32, I_33 = I_33,m = m, r = r, r_CM = r_CM)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(bodyShape.frame_a, frame_a) annotation(
    Line(points = {{-10, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(bodyShape.frame_b, frame_b) annotation(
    Line(points = {{10, 0}, {100, 0}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Line(points = {{-60, 0}, {60, 0}, {60, 0}}, thickness = 6), Ellipse(origin = {76, 0}, lineThickness = 3.5, extent = {{-10, 10}, {10, -10}}), Ellipse(origin = {-76, 0}, lineThickness = 3.5, extent = {{-10, 10}, {10, -10}})}));
end Rod;
