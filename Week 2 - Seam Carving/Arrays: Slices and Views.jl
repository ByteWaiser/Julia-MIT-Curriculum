### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 1c93c4a0-8ff5-11eb-3fba-61b4d24a2c2c
md"""
# Arrays Slices and Views
Since arrays are a very common way of storing data, it is important to know how to manipulate them.

Suppose we start with a vector (1-dimensional array) of all ones:
"""

# ╔═╡ 6856899a-8ff5-11eb-3895-0d8f948736f8
v = ones(Int, 10)

# ╔═╡ 71dc1aa2-8ff5-11eb-37cb-5ddba7a0be3e
md"""
We can **index** into the array to extract a certain element using square brackets ("[" and "]"):
"""

# ╔═╡ 874e7394-8ff5-11eb-27d6-fb7393cd033d
# Julia starts from one
v[3]

# ╔═╡ 91981a3a-8ff5-11eb-1dd4-9f5661c08432
md"""
We can modify that element using the same syntax:
"""

# ╔═╡ 9fd129de-8ff5-11eb-06fa-2d69f0a7d09a
v[3] = 8

# ╔═╡ a55fdf80-8ff5-11eb-1a1b-df3befff0633
v

# ╔═╡ a727e3fa-8ff5-11eb-363a-0d39e413f3a6
md"""
If we want to extract a subset of the array, we can do so by indexing using a **range**:
"""

# ╔═╡ c953645e-8ff5-11eb-2964-d5f58f5a6f7e
v[2:5]

# ╔═╡ dbadee9c-8ff5-11eb-0607-3f78c5822196
md"""
We call this a slice of the array
"""

# ╔═╡ e60d51c0-8ff5-11eb-1a8b-59e2e7043db3
md"""
## Modifying a slice: Broadcasting
How can we modify this slice, say to replace them all by the value 4? Intuitively you might expect to be able to write:
"""

# ╔═╡ 05001bdc-8ff6-11eb-113e-874974d9ba11
v[3:5] = 4

# ╔═╡ 09903428-8ff6-11eb-0bc4-cd3d66aea045
md"""
But Julia does not allow this. The problem is that the two objects on the two sides of the assignment are different types: an arrayt on the left, and a number on the right. What we want to do is modify the array *element* by *element*; for this we need to **broadcast** the assingment using ".":
"""

# ╔═╡ 4119ca8a-8ff6-11eb-2163-a3da64173ecc
v[3:5] .= 4

# ╔═╡ 4e999f5a-8ff6-11eb-3abe-4589bfca6d74
v

# ╔═╡ 539236ac-8ff6-11eb-122b-657b6f1d75db
v[6:8] = [6, 7, 8]

# ╔═╡ 67f36e4a-8ff6-11eb-1437-8195953b939e
v

# ╔═╡ 69a8e012-8ff6-11eb-35f7-6ddd0b311bc9
md"""
## Array slices
Now suppose we give a name to that array slice:
"""

# ╔═╡ 82674dbe-8ff6-11eb-2143-f5cb1db2ec79
w = v[3:5]

# ╔═╡ 84c319d0-8ff6-11eb-3a31-61cc73d6b673
md"""
An important question is the following:
>*What happens if we modify w?*
"""

# ╔═╡ 99310b8e-8ff6-11eb-31f8-b5b4eb2ea37b
w[1] = 24

# ╔═╡ fa4612e8-8ff6-11eb-35b8-f7e8df9ce33c
w

# ╔═╡ faf975c2-8ff6-11eb-2746-776abe32e459
v

# ╔═╡ fb7fde32-8ff6-11eb-12dd-0ff414ca94b1
md"""
*v* did not modified! What is happening is that the slice syntax v[3:5] actually creates a *copy* of the data in a new place in memory. Then w is a label, or pointer, for that new piece of memory. So modifying it does not touch the origional values at all!
"""

# ╔═╡ 3ab5736e-8ff7-11eb-09ae-7f48568b7dc4
md"""
## Array views
Of course, there are times when we do not want to make a copy. We might want to give a name to a slice of an array and manioualte the *original* array using the new name.

To do so we need ot make a **view** of the array. This is literally liek a window that allows us to view (read and write) to the *same data*.

To do this we use the `view` function:
"""

# ╔═╡ 7f34bf36-8ff7-11eb-02a8-95fbaa7fe859
z = view(v, 3:5)

# ╔═╡ 8775fb88-8ff7-11eb-3f4f-8b5843b26f10
z[1] = 12

# ╔═╡ 8c1cb53c-8ff7-11eb-2751-af06ef9bdbfd
z

# ╔═╡ 8cda6d8e-8ff7-11eb-3677-d9e782057b5a
v

# ╔═╡ 8d85d21e-8ff7-11eb-16ec-2f0c870a58cc
z .= 3

# ╔═╡ 98db52a6-8ff7-11eb-3bcf-f167f2ff0745
v

# ╔═╡ 999296c8-8ff7-11eb-0bf7-536554ea14ea
typeof(v), typeof(w), typeof(z)

# ╔═╡ aa96ee6a-8ff7-11eb-2645-8341aba55eaa
md"""
## Nices syntax for views
Now we know how to produce views/SubArrays. But to do so we had to move away from the nice, compact array slicing syntax, from `v[3:5]` to `view(v, 3:5)`.

To combine the two Julia provides a *macro* `@view` that converts the slicing syntax into a view:
"""

# ╔═╡ 1551bcbc-8ff8-11eb-15d6-7f5fa798823e
z2 = @view v[3:5]

# ╔═╡ 1f1e4c1a-8ff8-11eb-0b71-21e3b0f11f26
typeof(z2)

# ╔═╡ 30acfdfa-8ff8-11eb-3860-8779cbb44a39
z2 .= 10

# ╔═╡ 32a9497c-8ff8-11eb-2e56-b9b1f4d1c6a5
v

# ╔═╡ 3345b020-8ff8-11eb-3946-3545f24cdc34
md"""
Same things work for matrices as well:
"""

# ╔═╡ 418bccda-8ff8-11eb-0c8b-4f75147c930f
M = [10i+j for i in 0:5, j in 1:4]

# ╔═╡ 720e9060-8ff8-11eb-34e7-f9196159cbcc
M[3:5, 1:2]

# ╔═╡ 76b426b6-8ff8-11eb-2eba-0f0fef54e147
view(M, 3:5, 1:2)

# ╔═╡ 7cf7426a-8ff8-11eb-3d6a-9f5a68c80939
@view M[3:5, 1:2]

# ╔═╡ 83beeae4-8ff8-11eb-01e1-cd97809c78de
md"""
## Reshaping matrices
There's something else we would like to be able to do with matrices: **reshape** them. We can do so using the `reshape` function:
"""

# ╔═╡ a1d57336-8ff8-11eb-2ed6-05e331f9199b
M2 = reshape(M, 3, 8)

# ╔═╡ ac142036-8ff8-11eb-025e-e9ff77bbe9ef
M2 .= 1

# ╔═╡ b15aed7c-8ff8-11eb-39d5-57629f4bd2ae
M

# ╔═╡ b24eedb4-8ff8-11eb-20ec-3f20c051379b
md"""
Similarly, we might want to turn the matrix into a vector. For this we can use the `vec` function:
"""

# ╔═╡ c6fa870a-8ff8-11eb-001e-f9f307015ee5
vv = vec(M)

# ╔═╡ cad2cc84-8ff8-11eb-01e3-716ee80da5f1
vv .= 2

# ╔═╡ d909a322-8ff8-11eb-2371-75b7f57abffe
M

# ╔═╡ d9d5883e-8ff8-11eb-0c61-e53fd11be1c0
M2

# ╔═╡ Cell order:
# ╟─1c93c4a0-8ff5-11eb-3fba-61b4d24a2c2c
# ╠═6856899a-8ff5-11eb-3895-0d8f948736f8
# ╟─71dc1aa2-8ff5-11eb-37cb-5ddba7a0be3e
# ╠═874e7394-8ff5-11eb-27d6-fb7393cd033d
# ╟─91981a3a-8ff5-11eb-1dd4-9f5661c08432
# ╠═9fd129de-8ff5-11eb-06fa-2d69f0a7d09a
# ╠═a55fdf80-8ff5-11eb-1a1b-df3befff0633
# ╟─a727e3fa-8ff5-11eb-363a-0d39e413f3a6
# ╠═c953645e-8ff5-11eb-2964-d5f58f5a6f7e
# ╟─dbadee9c-8ff5-11eb-0607-3f78c5822196
# ╟─e60d51c0-8ff5-11eb-1a8b-59e2e7043db3
# ╠═05001bdc-8ff6-11eb-113e-874974d9ba11
# ╟─09903428-8ff6-11eb-0bc4-cd3d66aea045
# ╠═4119ca8a-8ff6-11eb-2163-a3da64173ecc
# ╠═4e999f5a-8ff6-11eb-3abe-4589bfca6d74
# ╠═539236ac-8ff6-11eb-122b-657b6f1d75db
# ╠═67f36e4a-8ff6-11eb-1437-8195953b939e
# ╠═69a8e012-8ff6-11eb-35f7-6ddd0b311bc9
# ╠═82674dbe-8ff6-11eb-2143-f5cb1db2ec79
# ╟─84c319d0-8ff6-11eb-3a31-61cc73d6b673
# ╠═99310b8e-8ff6-11eb-31f8-b5b4eb2ea37b
# ╠═fa4612e8-8ff6-11eb-35b8-f7e8df9ce33c
# ╠═faf975c2-8ff6-11eb-2746-776abe32e459
# ╟─fb7fde32-8ff6-11eb-12dd-0ff414ca94b1
# ╟─3ab5736e-8ff7-11eb-09ae-7f48568b7dc4
# ╠═7f34bf36-8ff7-11eb-02a8-95fbaa7fe859
# ╠═8775fb88-8ff7-11eb-3f4f-8b5843b26f10
# ╠═8c1cb53c-8ff7-11eb-2751-af06ef9bdbfd
# ╠═8cda6d8e-8ff7-11eb-3677-d9e782057b5a
# ╠═8d85d21e-8ff7-11eb-16ec-2f0c870a58cc
# ╠═98db52a6-8ff7-11eb-3bcf-f167f2ff0745
# ╠═999296c8-8ff7-11eb-0bf7-536554ea14ea
# ╟─aa96ee6a-8ff7-11eb-2645-8341aba55eaa
# ╠═1551bcbc-8ff8-11eb-15d6-7f5fa798823e
# ╠═1f1e4c1a-8ff8-11eb-0b71-21e3b0f11f26
# ╠═30acfdfa-8ff8-11eb-3860-8779cbb44a39
# ╠═32a9497c-8ff8-11eb-2e56-b9b1f4d1c6a5
# ╟─3345b020-8ff8-11eb-3946-3545f24cdc34
# ╠═418bccda-8ff8-11eb-0c8b-4f75147c930f
# ╠═720e9060-8ff8-11eb-34e7-f9196159cbcc
# ╠═76b426b6-8ff8-11eb-2eba-0f0fef54e147
# ╠═7cf7426a-8ff8-11eb-3d6a-9f5a68c80939
# ╟─83beeae4-8ff8-11eb-01e1-cd97809c78de
# ╠═a1d57336-8ff8-11eb-2ed6-05e331f9199b
# ╠═ac142036-8ff8-11eb-025e-e9ff77bbe9ef
# ╠═b15aed7c-8ff8-11eb-39d5-57629f4bd2ae
# ╟─b24eedb4-8ff8-11eb-20ec-3f20c051379b
# ╠═c6fa870a-8ff8-11eb-001e-f9f307015ee5
# ╠═cad2cc84-8ff8-11eb-01e3-716ee80da5f1
# ╠═d909a322-8ff8-11eb-2371-75b7f57abffe
# ╠═d9d5883e-8ff8-11eb-0c61-e53fd11be1c0
