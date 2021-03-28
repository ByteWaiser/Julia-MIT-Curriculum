### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ b0dcf864-89e4-11eb-1cb2-45fc35eae6d0
begin
	using Images
	philip = load("philip.jpg")
end

# ╔═╡ dd61fbf8-89e3-11eb-3795-63ad27cdddf7
md"# Module I: Images"

# ╔═╡ f879a290-89e3-11eb-33f5-b38cc15a1d65
md"## What is an image
- A grid of coloured squares called pixels
- A colour for each pair (i,j) of indices
- A discretization"

# ╔═╡ 90b53902-89e4-11eb-0967-db4acff8e602
url = "https://i.imgur.com/VGPeJ6s.jpg"

# ╔═╡ a27d2a0a-89e4-11eb-307d-a7221b0a2e90
download(url, "philip.jpg")

# ╔═╡ ca68aeb8-89e4-11eb-0c6e-5beba8185197
typeof(philip)
# 2 dimensional array with the type RGBX

# ╔═╡ db58c370-89e4-11eb-3a3b-db8013422e74
RGBX(0.4, 0.2, 0.3)

# ╔═╡ ffde8f18-89e4-11eb-187a-b5ec02e773ef
RGB(0,1,0.5)

# ╔═╡ 112eecc4-89e5-11eb-35b2-e14677a4df8e
size(philip)

# ╔═╡ 132ec70e-89e5-11eb-067e-c925c20cb5e6
philip[100, 400]

# ╔═╡ 23bcdba6-89e5-11eb-12c5-4b402edb9130
typeof(philip[100,400])

# ╔═╡ 2c3a1f32-89e5-11eb-1672-5f7885218de6
philip[600:1000, 1:400]

# ╔═╡ 3898042e-89e5-11eb-1d22-074af393affb
begin
	h, w = size(philip)
	head = philip[h ÷ 2:h, w ÷ 10:9w ÷ 10]
end

# ╔═╡ 9ef1e064-89e5-11eb-2fd8-71acde275bbe
size(head)

# ╔═╡ a5726008-89e5-11eb-354e-c9d088bafcb0
size(philip)

# ╔═╡ c02ff658-89e5-11eb-3577-f71d31fcf38d
size(head) ./ size(philip)

# ╔═╡ e8d06c82-89e5-11eb-149a-db65b1a7cf2e
[head head]

# ╔═╡ eda12f76-89e5-11eb-3525-17bd7e931a63
 [head reverse(head, dims=2); reverse(head, dims=1) reverse(reverse(head, dims=2), dims=1)]

# ╔═╡ 2b307a72-89e6-11eb-3b0f-6d8863e72ea2
new_phil = copy(head)

# ╔═╡ 4763ed64-89e6-11eb-1ff9-8b538ed1400c
for i in 1:100, j in 1:300
	new_phil[i, j] = RGB(1,0,0)
end

# ╔═╡ 66bbcae2-89e6-11eb-2f37-6fe00fdb4683
new_phil

# ╔═╡ 8f5ccd8e-89e6-11eb-32fc-2962abc4102c
new_phil[100:200, 1:100] .= RGB(0, 1, 0) # Broadcasting

# ╔═╡ a84126b0-89e6-11eb-3fa5-e19495789a3a
new_phil

# ╔═╡ d4ac0aba-89e6-11eb-1c75-6d461dd03244
function greenify(color)
	return RGB(0, color.g, 0)
end

# ╔═╡ e0597cfc-89e6-11eb-2d5a-abf689b7dbad
begin
	color = RGB(0.8, 0.7, 0.6)
	[color greenify(color)]
end

# ╔═╡ f151f35e-89e6-11eb-1ae0-db3771bc212e
greenify.(philip)

# ╔═╡ 941cb05c-89e7-11eb-3c8d-6bbe28625832
typeof(head)

# ╔═╡ 8d61ac4c-89e7-11eb-3f2f-2b3f6d6de235
function decimate(M::Array{T, 2} where T <: RGB{Normed{UInt8, 8}}, jump::Int=2)
	M_size = size(M)
	#return M[1:jump:M_size[1], 1:jump:M_size[2]]
	return M[1:jump:end, 1:jump:end]
end
# Jump select to compress image

# ╔═╡ 79a0d73c-89e7-11eb-34d1-b732872cc351
poor_phil = decimate(new_phil, 5)

# ╔═╡ Cell order:
# ╟─dd61fbf8-89e3-11eb-3795-63ad27cdddf7
# ╟─f879a290-89e3-11eb-33f5-b38cc15a1d65
# ╠═90b53902-89e4-11eb-0967-db4acff8e602
# ╠═a27d2a0a-89e4-11eb-307d-a7221b0a2e90
# ╠═b0dcf864-89e4-11eb-1cb2-45fc35eae6d0
# ╠═ca68aeb8-89e4-11eb-0c6e-5beba8185197
# ╠═db58c370-89e4-11eb-3a3b-db8013422e74
# ╠═ffde8f18-89e4-11eb-187a-b5ec02e773ef
# ╠═112eecc4-89e5-11eb-35b2-e14677a4df8e
# ╠═132ec70e-89e5-11eb-067e-c925c20cb5e6
# ╠═23bcdba6-89e5-11eb-12c5-4b402edb9130
# ╠═2c3a1f32-89e5-11eb-1672-5f7885218de6
# ╠═3898042e-89e5-11eb-1d22-074af393affb
# ╠═9ef1e064-89e5-11eb-2fd8-71acde275bbe
# ╠═a5726008-89e5-11eb-354e-c9d088bafcb0
# ╠═c02ff658-89e5-11eb-3577-f71d31fcf38d
# ╠═e8d06c82-89e5-11eb-149a-db65b1a7cf2e
# ╠═eda12f76-89e5-11eb-3525-17bd7e931a63
# ╠═2b307a72-89e6-11eb-3b0f-6d8863e72ea2
# ╠═4763ed64-89e6-11eb-1ff9-8b538ed1400c
# ╠═66bbcae2-89e6-11eb-2f37-6fe00fdb4683
# ╠═8f5ccd8e-89e6-11eb-32fc-2962abc4102c
# ╠═a84126b0-89e6-11eb-3fa5-e19495789a3a
# ╠═d4ac0aba-89e6-11eb-1c75-6d461dd03244
# ╠═e0597cfc-89e6-11eb-2d5a-abf689b7dbad
# ╠═f151f35e-89e6-11eb-1ae0-db3771bc212e
# ╠═941cb05c-89e7-11eb-3c8d-6bbe28625832
# ╠═8d61ac4c-89e7-11eb-3f2f-2b3f6d6de235
# ╠═79a0d73c-89e7-11eb-34d1-b732872cc351
