### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 55bc1b8a-89ef-11eb-2371-e129f7b49c21
begin
	using Images
	using ImageIO
	using Statistics
	using ImageFiltering
end

# ╔═╡ 80c2a8ae-8a6b-11eb-0d02-874f7b496b29
md"""
# Function definitions
"""

# ╔═╡ 8a190fb0-8a6b-11eb-3c33-ad3747164475
function decimate(arr, ratio)
	return arr[1:ratio:end, 1:ratio:end]
end

# ╔═╡ b01c0d16-8a6b-11eb-3966-9d91300ea4c0
function showColoredKernel(kernel)
	toRgb(x) = RGB(max(-x, 0), max(x, 0), 0)
	toRgb.(kernel) / maximum(abs.(kernel))
end

# ╔═╡ 781c4f02-8a84-11eb-0315-15b9872a2238
function shrinkImage(arr, ratio=5)
	s = size(arr) .÷ ratio
	
	arr2 = [mean(arr[i:i+ratio-1, j:j+ratio-1]) for i in 1:ratio:size(arr, 1)-ratio, j in 1:ratio:size(arr, 2)-ratio]
	return arr2
end

# ╔═╡ f9b23978-8a6b-11eb-04aa-3f42935da845
kernel = parent(Kernel.gaussian((3, 3)))

# ╔═╡ 71ef06f8-8a6e-11eb-204e-b5264149e014
showColoredKernel(kernel)

# ╔═╡ 89d07de4-8a6e-11eb-1b1f-f358755e6c51
function fillAround(arr, s=1, value=0)
	arr2 = hcat(fill(value, size(arr)[1], s), arr, fill(value, size(arr)[1], s))
	return vcat(fill(value, s, size(arr2)[2]), arr2, fill(value, s, size(arr2)[2]))
end

# ╔═╡ 973e8394-8a6f-11eb-1e69-8738766cec5e
function convolve(arr, kernel)
	kernel_size = size(kernel)[1]
	expanded_arr = fillAround(arr, kernel_size ÷ 2, RGB(0))
	new_arr = copy(arr)
	
	for i in 1:size(expanded_arr)[1] - kernel_size, j in 1:size(expanded_arr)[2] - kernel_size
		new_arr[i,j] = sum(expanded_arr[i:i+kernel_size-1, j:j+kernel_size-1] .* kernel)
	end
	return new_arr
end

# ╔═╡ 7e94b114-8a87-11eb-2897-790e253bef74
sharpen_kernel = [-0.5 -1.0 -0.5
				  -1.0 7.0 -1.0
				  -0.5 -1.0 -0.5]

# ╔═╡ baaa289e-8a89-11eb-25e1-31070dc3cd53
showColoredKernel(sharpen_kernel)

# ╔═╡ b7730952-8a89-11eb-3fd0-fd00cf4cdc11
edge_kernel = parent(Kernel.sobel()[1])

# ╔═╡ cc4024da-8a89-11eb-14d8-67ae4a147a67
showColoredKernel(edge_kernel)

# ╔═╡ d65c78cc-8a6a-11eb-36f5-57d759fe7937
philip = load("philip.jpg")

# ╔═╡ ef7676dc-8a72-11eb-2b99-fb1ce0135fdc
head = philip[1700:end-300, 500:2000]

# ╔═╡ e7a6c87a-8a84-11eb-23b4-515913d62093
shrinked_head = shrinkImage(head, 5)

# ╔═╡ cb3ea9ca-8a73-11eb-06ed-052c94b3718f
conv_image = convolve(shrinked_head, kernel)

# ╔═╡ d721b4a2-8a83-11eb-079b-df3cb43bcca6
size(conv_image)

# ╔═╡ d324f288-8a83-11eb-329e-0bfff82adce9
size(shrinked_head)

# ╔═╡ 54681046-8a87-11eb-05a9-6976643edf2e
convolve(shrinkImage(philip), kernel)

# ╔═╡ 97c818b0-8a87-11eb-2c62-e3d1383086a2
convolve(shrinkImage(philip, 5), sharpen_kernel)

# ╔═╡ 1915138c-8a88-11eb-0330-874c1b8cc3dd
Gray.(abs.(convolve(shrinkImage(philip), edge_kernel)))

# ╔═╡ dc7e194a-8a6a-11eb-26cd-b98fbe17b490
size(philip)

# ╔═╡ Cell order:
# ╠═55bc1b8a-89ef-11eb-2371-e129f7b49c21
# ╟─80c2a8ae-8a6b-11eb-0d02-874f7b496b29
# ╠═8a190fb0-8a6b-11eb-3c33-ad3747164475
# ╠═b01c0d16-8a6b-11eb-3966-9d91300ea4c0
# ╠═781c4f02-8a84-11eb-0315-15b9872a2238
# ╠═e7a6c87a-8a84-11eb-23b4-515913d62093
# ╠═f9b23978-8a6b-11eb-04aa-3f42935da845
# ╠═71ef06f8-8a6e-11eb-204e-b5264149e014
# ╠═89d07de4-8a6e-11eb-1b1f-f358755e6c51
# ╠═973e8394-8a6f-11eb-1e69-8738766cec5e
# ╠═ef7676dc-8a72-11eb-2b99-fb1ce0135fdc
# ╠═cb3ea9ca-8a73-11eb-06ed-052c94b3718f
# ╠═d324f288-8a83-11eb-329e-0bfff82adce9
# ╠═d721b4a2-8a83-11eb-079b-df3cb43bcca6
# ╠═54681046-8a87-11eb-05a9-6976643edf2e
# ╠═7e94b114-8a87-11eb-2897-790e253bef74
# ╠═97c818b0-8a87-11eb-2c62-e3d1383086a2
# ╠═baaa289e-8a89-11eb-25e1-31070dc3cd53
# ╠═b7730952-8a89-11eb-3fd0-fd00cf4cdc11
# ╠═cc4024da-8a89-11eb-14d8-67ae4a147a67
# ╠═1915138c-8a88-11eb-0330-874c1b8cc3dd
# ╠═d65c78cc-8a6a-11eb-36f5-57d759fe7937
# ╠═dc7e194a-8a6a-11eb-26cd-b98fbe17b490
