function output = loadDepth(path)
    temp = load(path);
    output = temp.apmdata.drive_data(2).depth;
end

