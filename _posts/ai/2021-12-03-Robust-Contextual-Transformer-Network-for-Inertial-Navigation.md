---

title: Robust Contextual Transformer Network for Inertial Navigation

layout: post

categories: [Ai]

sub_class: Robotic

tags: [Transformer, Attention, ResNet, IMU]

keywords: Inertial Navigation, Transformer, Attention, ResNet, IMU

desc: A ResNet-based encoder enhanced by local and global multi-head self-attention to capture spatial contextual information from IMU measurements.

date: 2021-12-03

author: Bing

paper: "/static/data/paper/2022-AAAI/2022-AAAI-CTIN.pdf"

code: "https://github.com/bingrao/ctin"

---


# Abstract

Recently, data-driven inertial navigation approaches have demonstrated their capability of using well-trained neural networks to obtain accurate position estimates from inertial measurement units (IMU) measurements. In this paper, we propose a novel robust Contextual Transformer-based network for Inertial Navigation~(CTIN) to accurately predict velocity and trajectory. To this end, we first design a ResNet-based encoder enhanced by local and global multi-head self-attention to capture spatial contextual information from IMU measurements. Then we fuse these spatial representations with temporal knowledge by leveraging multi-head attention in the Transformer decoder. Finally, multi-task learning with uncertainty reduction is leveraged to improve learning efficiency and prediction accuracy of velocity and trajectory. Through extensive experiments over a wide range of inertial datasets~(e.g., RIDI, OxIOD, RoNIN, IDOL, and our own), CTIN is very robust and outperforms state-of-the-art models.

# System Architecture

<img 
    src="{{ "/static/data/paper/2022-AAAI/images/Visio-arch.jpg" | prepend: site.baseurl }}" 
    alt="Italian Trulli" style="width: 100%; min-width: 100%;">

<p>
  When \(a \ne 0\), there are two solutions to \(ax^2 + bx + c = 0\) and they are
  \[x = {-b \pm \sqrt{b^2-4ac} \over 2a}.\]
</p>


<p>
  When \(a \ne 0\), there are two solutions to \(ax^2 + bx + c = 0\) and they are
  \[x = \frac{-b \pm \sqrt{b^2-4ac}}{2a}.\]
</p>

# Experimental Results


# Conclusion



