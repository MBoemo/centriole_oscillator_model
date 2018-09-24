function out = lorentz( t, centre, width, amplitude )

    out = amplitude/(pi*width*(1 + ((t - centre)^2)/(width^2)));

end

