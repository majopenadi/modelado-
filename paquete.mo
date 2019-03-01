package paquete
  package conectores
    connector pin
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
    end pin;

    connector pos_pin
      Modelica.SIunits.Voltage v "Electric Potential";
      flow Modelica.SIunits.Current i "Current Flow";
      annotation(
        Icon(graphics = {Ellipse(origin = {2, 3}, lineColor = {255, 85, 255}, fillColor = {255, 85, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-38, 39}, {38, -39}}, endAngle = 360), Bitmap(extent = {{-2, 20}, {-2, 20}})}));
    end pos_pin;

    connector negpin
      Modelica.SIunits.Voltage v "Electric Potential";
      flow Modelica.SIunits.Current i "Current Flow";
      annotation(
        Icon(graphics = {Ellipse(origin = {2, 2}, lineColor = {255, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-36, 38}, {36, -38}}, endAngle = 360)}));
    end negpin;
  end conectores;

  partial model dospin
   Modelica.SIunits.Voltage v;
      Modelica.SIunits.Current i;
        paquete.conectores.pos_pin p annotation(
          Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        paquete.conectores.negpin n annotation(
          Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      annotation(
          Icon(graphics = {Rectangle(origin = {0, -1}, extent = {{-80, 41}, {80, -39}})}));
  end dospin;

  package modelos
    model fuente
      parameter Modelica.SIunits.Current I(start = 1) "Value of constant current";
      extends paquete.conectores.dospin;
    equation
      i = I;
    end fuente;

    model fuente1
     parameter Modelica.SIunits.Voltage V(start=1) "Value of constant voltage";
          extends paquete.conectores.dospin;
    equation
v=V;
    end fuente1;
  end modelos;
end paquete;
