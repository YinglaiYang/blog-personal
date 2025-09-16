+++
title = "Learning-Notes: Arxiv 2103.00020 - Learning Transferable Visual Models from Natural Language Supervision"
description = ""
date = 2025-09-15
draft = false
+++

_Note: This is a living document and is subject to change. The next time you visit, content might differ._

# Focus on the paper "Learning Transferable Visual Models from Natural Language Supervision"
## Introduction
The paper "Learning Transferable Visual Models from Natural Language Supervision" presents CLIP, a method for Contrastive Language-Image Pretraining. It is a pioneer in leveraging web-scale pairs of images and texts to achieve higher levels of generalization than previous computer vision SOTA models. 

At the time of the paper, SOTA models were pretrained on datasets with fixed lists of specific classes. For example [ImageNet with 1000 classes](https://deeplearning.cms.waikato.ac.nz/user-guide/class-maps/IMAGENET/).

Models trained in this way will be limited to the specified classes only. This limits their general application, since they can only correctly handle previously specified classes. The task of designing classes and gathering training data is bottlenecked by humans, which means it is not well scalable.

In contrast the internet contains a rich collection of images that have some form of annotation. For example text descriptions for accessibility, text surrounding images, text in photo libraries, Instagram posts etc. 

The main idea of the authors, from my understanding, is that leveraging the huge corpus of image-text pairs in the internet would enable a much more general visual understanding. For the paper, the authors created a new dataset which contains image-text pairs for **every** word that appears at least 100 times in the English Wikipedia.

For me the most important points in this paper are:
- The model architecture that allows a much more general image understanding.
- Contrastive pretraining allows the model to learn robustly from "messy" web data.
- Ablation studies show that CLIP has good zero-shot-transfer.

I will expand in later sections about what I found noteworthy.

## Video Presentation and Paper Page of CLIP at ICML
If you want to watch a video for an overview before diving into the paper or want to hear the researchers: There is a video recording of the paper presentation at ICML 2021 by the researchers. It is only 20min short and is an easy watch.

Please visit **https://icml.cc/virtual/2021/poster/9193** to watch the video presentation.
Below the video is embedded for preview.
<iframe src="https://slideslive.com/embed/presentation/38958587?js_embed_version=3&embed_init_token=eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NTc4ODM3MTgsImV4cCI6MTc1ODAxMzMxOCwidSI6eyJ1dWlkIjoiNmVjMDFhYmQtZjVkMC00ZWFkLWI3MWUtOTc1YzVkNmE3NTY1IiwiaSI6bnVsbCwiZSI6bnVsbCwibSI6ZmFsc2V9LCJkIjoiaWNtbC5jYyJ9.-UL0blPtuz64z8rtUvg4n2q8--nmMEYd1VKa-BxSISQ&embed_parent_url=https%3A%2F%2Ficml.cc%2Fvirtual%2F2021%2Fposter%2F9193&embed_origin=https%3A%2F%2Ficml.cc&embed_container_id=presentation-embed-38958587&auto_load=true&auto_play=false&zoom_ratio=&disable_fullscreen=false&locale=de&vertical_enabled=true&vertical_enabled_on_mobile=false&allow_hidden_controls_when_paused=true&fit_to_viewport=true&custom_user_id=&user_uuid=6ec01abd-f5d0-4ead-b71e-975c5d6a7565" width="100%" height="300">
  <p>Your browser does not support iframes.</p>
</iframe>

## Notes about highlights of the paper in more detail
## The model architecture
## Contrastive Learning
## Ablation studies
## Findings for Inference
### Efficient Inference
### Prompting change
### Zero-Shot vs. Few-Shot

# CLIP in Context
## The Vision-Transformer
Dosovitsky
## Role of CLIP in VLMs
## Successors of CLIP and Alternatives to it


# Glossary
## Hypernetwork
"Hypernetwork" is mentioned in section 3.1.2 of the paper. Specifically:
> The cosine similarity of these embeddings is then calculated,
scaled by a temperature parameter τ, and normalized into a
probability distribution via a softmax. Note that this predic-
tion layer is a multinomial logistic regression classifier with
L2-normalized inputs, L2-normalized weights, no bias, and
temperature scaling. **When interpreted this way, the image
encoder is the computer vision backbone which computes a
feature representation for the image and the text encoder is a
hypernetwork (Ha et al., 2016) which generates the weights
of a linear classifier based on the text specifying the visual
concepts that the classes represent.**

**From ChatGPT:**
> A hypernetwork is a neural network that outputs the weights of another network, rather than predictions directly.
> -	Example: Instead of predicting a label, a hypernetwork might output the parameters of a classifier that can then be applied to some other input.
>
> In CLIP’s case:
> -	Each class description (“a photo of a dog”, “a photo of a cat”) is passed through the text encoder.
> -	The output embedding of the text encoder acts as the weight vector for a linear classifier that separates that class from others.
> -	In other words, the text encoder generates the classifier weights on the fly, conditioned on the text prompt.

To put this more into context, consider Fig. 1 (2) and (3) with following annotations:
1. The **blue box** is the *multinomial logistic regression classifier with L2-normalized inputs, L2-normalized weights, no bias, and temperature scaling*. It is formed by combining both the text embeddings and the calculations like cosine similarity, softmax etc. The text embeddings can change and form the weights of this classifier.
2. The weights of this classifier change depending on the prediction task at hand. This will change which labels are encoded. This means that the "Text Encoder" puts out the weights of the classifier for prediction. **This makes the "Text Encoder" a hypernetwork.** It does not create a self-sufficient prediction, but rather weights for another model.
3. The "Image Encoder" extracts the features for the multinomial logistic regression classifier, which serve as input (following along the orange arrow).
![alt text](zero-shot-classic-dataset-classifier_annotated-hypernetwork.png)