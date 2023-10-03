using ApproxFun, Plots
d  = 0..1  # domain [0,1]
sp = Legendre(d) # space of Legendre polynomials

# 1. Renyi's parking problem
V = Volterra(sp)
F = DefiniteIntegral(sp)
v = Vector{Function}(undef, 5)
v[1] = t -> 0.0
v[2] = t -> 1.0
v[3] = t -> 2/(t+1)*t + 1
v4a = V*Fun(v[3],sp)
v[4] = t -> 2/(t+2)*(1+v4a(t)) + 1
v5a = F*Fun(v[3],sp) + V*Fun(v[4],sp)
v[5] = t -> 2/(t+3)*(1+v5a(t)) + 1               
# plot the solution
plot(v[1], 0,1, label="u₁(x)", color=:blue)
for i in 2:5
    plot!(x->v[i](x-i+1), i-1,i, label="",color=:black)
end
print("endpoint exact to around 15 digits: ",v[5](1))
plot!([1,1],[0,1], label="", color=:black)
xlabel!("x")
