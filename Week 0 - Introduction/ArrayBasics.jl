### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 8738bb04-89cd-11eb-1bdb-4da29f761a59
begin
	using Pkg
	Pkg.add.(["Images", "ImageIO", "ImageMagick"])
	using Images
end

# ╔═╡ abfb6324-89cd-11eb-3bb7-5746c9b4fd8c
v = [1, 2, 3, 4]

# ╔═╡ b9fb9156-89cd-11eb-0374-05a6c34c1986
size(v)

# ╔═╡ bbb451ba-89cd-11eb-3d48-dbdcbd75c034
w = [1 2 3
	 4 5 6]

# ╔═╡ c202107a-89cd-11eb-37ce-9d45e3705fdf
size(w)

# ╔═╡ c3cd0be2-89cd-11eb-2d64-0346e25c5577
w[1,1]

# ╔═╡ c5fd5fde-89cd-11eb-1f8f-194547cc7081
w[2,3]

# ╔═╡ cdabc93c-89cd-11eb-03cc-3dded5fec998
w[1,:]

# ╔═╡ d401d31c-89cd-11eb-3ce0-87705a06245f
w[:,1]

# ╔═╡ d5d7afd6-89cd-11eb-2abe-2912825713ee
w[:, 2:3]

# ╔═╡ f280c6b8-89cd-11eb-3d60-e1aca254c792
A1 = rand(1:9, 3, 4)

# ╔═╡ d494c7a6-89cf-11eb-0c5c-5b0080685c6d
size(A1)

# ╔═╡ 1e136432-89d0-11eb-3a0a-d7e84bcce123
function pretty(M::Matrix{T} where T<:String)
	max_length = maximum(length.(M))
	dv = "<div style='display:flex;flex-direction:row'>"
	HTML(dv*join([join("<div style='width:40px;text-align:center'>".*M[i,:].*"</div>", " ") for i in 1:size(M,1)], "</div>$dv")*"</div>")
end

# ╔═╡ da8564cc-89cf-11eb-27d6-71d67082d9e6
A2 = string.(rand("1a2b3c4d5e6f7g", 3, 4)) |> pretty

# ╔═╡ fbae547e-89cf-11eb-383d-b1fa55d28dc3
typeof(A2)

# ╔═╡ e40c5f36-89da-11eb-3b25-e5d1f0beb695
colors = distinguishable_colors(100)

# ╔═╡ 012db330-89db-11eb-311f-ed6d30e19b0d
A3 = rand(colors, 5, 5)

# ╔═╡ 18ed1b78-89db-11eb-333b-a7c90025cf29
typeof(colors)

# ╔═╡ b77a57f6-89e0-11eb-2765-851931815332
typeof(A3)

# ╔═╡ bba52a04-89e0-11eb-001c-c1e1b0b1a8eb
size(A3)

# ╔═╡ c5552234-89e0-11eb-3832-bf25c113093d
lion = load(download("https://ichef.bbci.co.uk/news/976/cpsprodpb/1CE8/production/_109100470_ed01bd7f-0c64-4f6b-9d29-f43261119ade.jpg"))

# ╔═╡ 15329afc-89e1-11eb-03e5-8bfb6e412b5d
fill(lion, 3, 3)

# ╔═╡ 270e8a24-89e1-11eb-27b0-6d9b3b0050e5
begin
	B = copy(A1)
	B[1,1] = 12
	B
end

# ╔═╡ 701cb95c-89e1-11eb-0b47-a3ee488947e4
D = [i * j for i in 1:10, j in 1:10]

# ╔═╡ b56222c2-89e1-11eb-353c-dbcf02dc9c84
begin
	E = fill(0, 5, 5)
	for i in 1:5, j in 1:5
		E[i, j] = i * j
	end
	E
end

# ╔═╡ 01ae9156-89e2-11eb-02ac-c3f2cf0d2086
begin
	E2 = fill(0, 5, 5)
	for i = 1:5
		for j in 1:5
			E2[i,j] = i*j
		end
	end
	E2
end

# ╔═╡ 1f54f146-89e2-11eb-1244-87669fe54405
E*2

# ╔═╡ 3d9d6a68-89e2-11eb-2001-ab5639f28a6d
E^2 # Matrix Mult

# ╔═╡ 40038cea-89e2-11eb-2d71-174b6bfd3d73
E*E

# ╔═╡ 418620be-89e2-11eb-0ad2-3100f7ea62e4
E.^2 # Element Wise Squared

# ╔═╡ 437d8650-89e2-11eb-3b76-fdbe3aa32c60
[A1 A1] # Horizontal append

# ╔═╡ 597c5f6e-89e2-11eb-37f0-8958949125f4
[A1
 A1] # Vertical Append

# ╔═╡ 6070bd0e-89e2-11eb-2428-8bb3dcc35ad8
[A3 A3]

# ╔═╡ 6b9b3e66-89e2-11eb-198b-f1330839fb89
[A3 A3;A3 A3]

# ╔═╡ Cell order:
# ╠═8738bb04-89cd-11eb-1bdb-4da29f761a59
# ╠═abfb6324-89cd-11eb-3bb7-5746c9b4fd8c
# ╠═b9fb9156-89cd-11eb-0374-05a6c34c1986
# ╠═bbb451ba-89cd-11eb-3d48-dbdcbd75c034
# ╠═c202107a-89cd-11eb-37ce-9d45e3705fdf
# ╠═c3cd0be2-89cd-11eb-2d64-0346e25c5577
# ╠═c5fd5fde-89cd-11eb-1f8f-194547cc7081
# ╠═cdabc93c-89cd-11eb-03cc-3dded5fec998
# ╠═d401d31c-89cd-11eb-3ce0-87705a06245f
# ╠═d5d7afd6-89cd-11eb-2abe-2912825713ee
# ╠═f280c6b8-89cd-11eb-3d60-e1aca254c792
# ╠═d494c7a6-89cf-11eb-0c5c-5b0080685c6d
# ╠═da8564cc-89cf-11eb-27d6-71d67082d9e6
# ╠═fbae547e-89cf-11eb-383d-b1fa55d28dc3
# ╠═1e136432-89d0-11eb-3a0a-d7e84bcce123
# ╠═e40c5f36-89da-11eb-3b25-e5d1f0beb695
# ╠═012db330-89db-11eb-311f-ed6d30e19b0d
# ╠═18ed1b78-89db-11eb-333b-a7c90025cf29
# ╠═b77a57f6-89e0-11eb-2765-851931815332
# ╠═bba52a04-89e0-11eb-001c-c1e1b0b1a8eb
# ╠═c5552234-89e0-11eb-3832-bf25c113093d
# ╠═15329afc-89e1-11eb-03e5-8bfb6e412b5d
# ╠═270e8a24-89e1-11eb-27b0-6d9b3b0050e5
# ╠═701cb95c-89e1-11eb-0b47-a3ee488947e4
# ╠═b56222c2-89e1-11eb-353c-dbcf02dc9c84
# ╠═01ae9156-89e2-11eb-02ac-c3f2cf0d2086
# ╠═1f54f146-89e2-11eb-1244-87669fe54405
# ╠═3d9d6a68-89e2-11eb-2001-ab5639f28a6d
# ╠═40038cea-89e2-11eb-2d71-174b6bfd3d73
# ╠═418620be-89e2-11eb-0ad2-3100f7ea62e4
# ╠═437d8650-89e2-11eb-3b76-fdbe3aa32c60
# ╠═597c5f6e-89e2-11eb-37f0-8958949125f4
# ╠═6070bd0e-89e2-11eb-2428-8bb3dcc35ad8
# ╠═6b9b3e66-89e2-11eb-198b-f1330839fb89
