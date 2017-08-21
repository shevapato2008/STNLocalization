function output = loadLFP(path)
    temp = load(path);
    output = temp.apmdata.channels.LFP;
end