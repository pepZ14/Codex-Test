# 生成两个各有 100 个样本的变量，并绘制带线性拟合线的散点图。
# 首次运行前安装依赖：install.packages("ggplot2")

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop('请先安装 ggplot2：install.packages("ggplot2")')
}

library(ggplot2)

# 固定随机种子，使结果可以复现。
set.seed(123)
x <- rnorm(100, mean = 10, sd = 2)
y <- 3 + 2 * x + rnorm(100, mean = 0, sd = 3)
samples <- data.frame(x = x, y = y)

scatter_plot <- ggplot(samples, aes(x = x, y = y)) +
  geom_point(color = "steelblue", size = 2, alpha = 0.7) +
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE,
              color = "firebrick", fill = "lightgray") +
  labs(title = "Scatter plot with linear fit (n = 100)",
       x = "X", y = "Y") +
  theme_minimal(base_size = 14)

print(scatter_plot)

# 在当前工作目录保存图片；灰色区域表示拟合线的 95% 置信区间。
ggsave("scatter_plot.png", plot = scatter_plot,
       width = 7, height = 5, dpi = 300)
