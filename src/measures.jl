function SPIKE_distance(spike_train, tstart=0, tstep=0.1, tend=5)
    for st in spike_train # Sanity check
        tstep ≤ minimum(st[2:end] - st[1:end-1]) || error("Timestep should be smaller than the minimum ISI")
        pushfirst!(st, tspan[1])
        push!(st,tspan[end])
    end

    tc = [2,2]
    tPF = [[0.0], [0.0]]
    ISI = [0.0, 0.0]
    for t in tspan
        for i in 1:2    # Get tPF and ISI at time t for both spike trains
            tPF[i] = spike_train[i][tc[i]-1:tc[i]]
            ISI[i] = spike_train[i][tc[i]] - spike_train[i][tc[i]-1]
            if t > spike_train[i][tc[i]]
                tc[i] += 1 
                tPF[i] = spike_train[i][tc[i]-1:tc[i]]
                ISI[i] = spike_train[i][tc[i]] - spike_train[i][tc[i]-1]
            end
        end
        # println(t, ' ', tc, ' ', ISI, ' ', tPF)
    end
end

spike_train = [sort(rand(Float64, 5)*tend), sort(rand(Float64, 5)*tend)]

SPIKE_distance(spike_train)