function [] = plotSpikes(spikes)
% @spikes: input spike matrix with the first 25 columns as spike info.
% @return: only plotting, no return needed

figure
plot(spikes(1, 1 : 25))
hold on
for i = 2 : 10
    plot(spikes(i, 1 : 25))
end
hold off

end

