### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ d48c9e38-89e2-11eb-23c9-85e0f9484586
e = [1 2; 3 4]

# ╔═╡ f86e0288-89e2-11eb-339e-cf6c35dc8f1c
fill(e, 3, 4)

# ╔═╡ fdade8d0-89e2-11eb-1efa-4f8a82ec1df7
typeof(e)

# ╔═╡ 168dbd6c-89e3-11eb-1a88-b98bcab82560
keeptrack = [typeof(1), typeof(1.0), typeof("one"), typeof(1//1), typeof([1 2; 3 4])]

# ╔═╡ 2797f44c-89e3-11eb-2af0-29bb1207917d
typeof(keeptrack)

# ╔═╡ Cell order:
# ╠═d48c9e38-89e2-11eb-23c9-85e0f9484586
# ╠═f86e0288-89e2-11eb-339e-cf6c35dc8f1c
# ╠═fdade8d0-89e2-11eb-1efa-4f8a82ec1df7
# ╠═168dbd6c-89e3-11eb-1a88-b98bcab82560
# ╠═2797f44c-89e3-11eb-2af0-29bb1207917d
