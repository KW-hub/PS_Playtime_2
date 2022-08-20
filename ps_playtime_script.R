#PS5なし、No.なしのデータ
dat <- read.csv("data.csv", header = TRUE, fileEncoding = "UTF-8-BOM")

head(dat)
is.na(dat)

#ヒストグラム描画用データの読み込み
hist_dat <- read.csv("hist_data.csv", header = TRUE, fileEncoding = "UTF-8-BOM")
hist_dat

library(ggplot2)
ggplot(data=hist_dat, aes(x=ClearTime, fill=Platform)) + labs(x = "Clear Time [min]") + geom_histogram(alpha=0.3, position="identity")

#箱ひげ図を描画
boxplot(dat, names = c("PS1", "PS2", "PS3", "PS4", "PS5"), xlab = "Platform", ylab = "ClearTime [min]")

#基本統計量
#na.rm = TRUE 欠損値は無視する
mean(dat$PS, na.rm = TRUE)
sd(dat$PS, na.rm = TRUE)
var(dat$PS, na.rm = TRUE)

mean(dat$PS2)
sd(dat$PS2)
var(dat$PS2)

mean(dat$PS3, na.rm = TRUE)
sd(dat$PS3, na.rm = TRUE)
var(dat$PS3, na.rm = TRUE)

mean(dat$PS4, na.rm = TRUE)
sd(dat$PS4, na.rm = TRUE)
var(dat$PS4, na.rm = TRUE)

mean(dat$PS5, na.rm = TRUE)
sd(dat$PS5, na.rm = TRUE)
var(dat$PS5, na.rm = TRUE)


#クラスカル・ウォリス検定を実施
#帰無仮説「各群の中央値は等しい」は棄却される
kruskal.test(x=dat)

#ボンフェローニ補正
pairwise.t.test(
  hist_dat$ClearTime,
  hist_dat$Platform, 
  paired = FALSE,
  p.adjust.method = 'bonferroni'
)
