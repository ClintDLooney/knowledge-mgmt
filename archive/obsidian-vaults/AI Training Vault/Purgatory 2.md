Output information on failed HTML snippets. Base your format on this example: 

1. Requirement: Provide text alternatives for images and other non-text elements. (Maps to WCAG guideline Non-text Content.) 
	* Issue Cateogry: Image elements that convey meaning but have no alt attribute
		* Why it Matters: Screen readers (software used by people who are blind or who use audio output) announce the alt text for images. When alt is missing, assistive technology has no way to convey the image’s purpose, which can hide important information. 
		* Issues Found for this Category
			* Issue 1: `<img class="imgl" src="images/site/small60-1.jpg">` 
				* Fix 1: If this image conveys meaning:, insert brief, accurate alt text. For example, `<img class="imgl" src="images/site/small60-1.jpg" alt="Computer parts and accessories">` This ensure non-visual users can understand the content. 
				* Fix 2: If this image conveys no meaning (is decorative, or if its information is fully redundant with nearby text), give it an empty alt attribute, for example `<img class="imgl" src="images/site/small60-1.jpg" alt="">` This prevents the screen reader from vocalizing nonrelevant  content.
			* Issue 2: `<img class="imgl" src="images/site/small60-2.jpg">`
				* Fix: `<img class="imgl" src="images/site/small60-2.jpg" alt="Exterior of our retail store">` 
				* Gray Area - Verify the subject of the photo to ensure the description matches.
* (etc.)