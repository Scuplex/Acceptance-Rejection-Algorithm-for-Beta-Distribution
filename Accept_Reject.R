# Number of samples 
n_samples <- 1e6
a <- 2.5
b <- 3.5
Ba_b <- beta(a, b)

# maximum value of the density
x_star <- (a-1)/(a+b-2)
c <- (x_star^1.5 * (1 - x_star)^2.5) / Ba_b

# Save samples
samples <- numeric(n_samples)
i <- 1

while (i <= n_samples) 
{
  x <- runif(1)
  f_x <- (x^1.5 * (1 - x)^2.5) / Ba_b
  g_x <- 1
  u <- runif(1)
  if (u <= f_x / (c * g_x)) 
  {
    samples[i] <- x  
    i <- i + 1
  }
  
}

# plotting
x_grid <- seq(0, 1, length.out = 200)
beta_pdf <- dbeta(x_grid, 2.5, 3.5)

hist(samples, probability = TRUE, main = "Accept-Reject: Beta(2.5,3.5) Sampling",
     xlab = "x", col = "lightblue", breaks = 60)

lines(x_grid, beta_pdf, col = "red", lwd = 2)
