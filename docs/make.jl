using NeuroSpikes
using Documenter

DocMeta.setdocmeta!(NeuroSpikes, :DocTestSetup, :(using NeuroSpikes); recursive=true)

makedocs(;
    modules=[NeuroSpikes],
    authors="nish <nishs1729@gmail.com> and contributors",
    repo="https://github.com/nishs1729/NeuroSpikes.jl/blob/{commit}{path}#{line}",
    sitename="NeuroSpikes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://nishs1729.github.io/NeuroSpikes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/nishs1729/NeuroSpikes.jl",
    devbranch="main",
)
