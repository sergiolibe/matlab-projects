function val=mapeo(x,in_min,in_max,out_min,out_max)
val=(x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
end