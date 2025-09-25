//TODO Process, refactor, learn.

A type of [[Artificial Neural Network]] designed to learn efficient representations (or codings) of unlabeled data.
You can train them using [[Supervised Machine Learning]] or [[Unsupervised Machine Learning]] to look, for example, through million s of images of similar subjects. Then the auto-encoder will encode these images into a sort of Platonic form of the subject. Many images of dogs into one image of the form of the dog. Then the image of the Form can be used to improve an imperfect image of an instance of that subject. Have a blurry picture of a dog? You can sharpen it using the form. 
An autoencoder encodes the form of the subject, and then decodes new images to more closely match this form. 
[[Encoding]]
The most popular encoder is the [[Variational Autoencoders (VAE)]].

* Pros
	* Good for image enhancement/fixing issues in a common subject/type of data. 
* Cons
	* Can only create forms of a subject once it's been trained on thousands or tens of thousands of [[Labeled Data]] of that subject. 
	* Not as flexible as a foundation model. You can't make weird or fantastical images. 

1. **Structure:** An autoencoder consists of two main parts:
    - **Encoder:** This part takes the input data (e.g., an image, text, or a data stream) and compresses it into a lower-dimensional representation called the **latent space** or **bottleneck**. It essentially extracts the most important features and patterns from the data.
    - **Decoder:** This part takes the compressed representation from the latent space and tries to reconstruct the original input data.
2. **Training:** Autoencoders are trained in an unsupervised manner. This means they don't require labeled data. The goal is to minimize the difference between the original input and the reconstructed output, which is measured by a **reconstruction loss** function.
3. **Purpose:** By training to reconstruct the input, the autoencoder learns an efficient encoding of the data in the latent space. This compressed representation captures the essential information of the data while potentially ignoring noise or irrelevant features. 

**Key Concepts:**

- **Latent Space:** The lower-dimensional space where the compressed representation of the input data is stored.
- **Unsupervised Learning:** Autoencoders learn from unlabeled data, discovering patterns and structure within the data itself.
- **Dimensionality Reduction:** A primary application of autoencoders is reducing the dimensionality of data by compressing it into the latent space.
- **Reconstruction Error:** The difference between the original input and the reconstructed output. Minimizing this error is the training objective. 

**Applications:**

Autoencoders have various applications in AI and machine learning, including:

- **Dimensionality reduction:** Compressing high-dimensional data for more efficient processing.
- **Image denoising:** Removing noise from images by learning to reconstruct clean images from noisy ones.
- **Anomaly detection:** Identifying unusual data points based on their high reconstruction error.
- **Feature extraction:** Learning to extract important features from data that can be used for other downstream tasks.
- **Generative models:** Some variants, like Variational Autoencoders (VAEs), can be used to generate new data.