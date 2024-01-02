function SPIKE_distance(spike_train, tstart=0, tstep=0.1, tend=5)
    tspan = tstart:tstep:tend
    for st in spike_train
        tstep ≤ minimum(st[2:end] - st[1:end-1]) || error("Timestep should be smaller than the minimum ISI")
        pushfirst!(st, tspan[1])
        push!(st,tspan[end])
    end

    tc = 2
    tlow = spike_train[1]
    for t in tspan
        if t ≤ spike_train[1][tc]
            println(t, spike_train[1][tc-1:tc])
        else
            tc += 1
            println(t, spike_train[1][tc-1:tc])
        end
    end
end