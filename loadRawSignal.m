function output = loadRawSignal(path)
    temp = load(path);
    output = temp.apmdata.channels.continuous;
end

