import { useState, useEffect } from 'react';

export interface FaqItem {
  question: string;
  answer: string;
}

interface NewJerseyFAQProps {
  faqs?: FaqItem[];
  stateName?: string;
}

// REMOVED: defaultFaqData - NO AI-generated fallbacks allowed
// If faqs are empty, we hide the entire FAQ section instead of showing NJ content

const REMOVED_defaultFaqData: FaqItem[] = [
  {
    question: 'Which Services do Marketing Agencies in New Jersey Offer?',
    answer: `Marketing agencies in New Jersey offer a wide range of services, each tailored to meet the diverse needs of businesses and organizations within the state. Here are some key services provided by New Jersey marketing agencies:

1. Digital Marketing in New Jersey: Agencies in New Jersey specialize in digital marketing strategies, including SEO, PPC, social media marketing, and email marketing, to enhance online visibility and engagement.

2. Brand Development in New Jersey: Many New Jersey marketing agencies focus on brand development, offering services like brand strategy, identity design, and brand positioning to establish and strengthen a brand's presence in the market.

3. Content Creation and Strategy in New Jersey: These agencies often provide content creation and strategy services, encompassing blog writing, video production, and content planning to engage audiences and convey brand messages effectively.

4. Social Media Management in New Jersey: In New Jersey, marketing agencies offer comprehensive social media management, including content creation, community engagement, and analytics, to enhance brand presence on platforms like Facebook, Instagram, and Twitter.

5. Public Relations in New Jersey: PR services, including media outreach, press release distribution, and event promotion, are also a forte of New Jersey marketing agencies, helping businesses to build and maintain a positive public image.

6. Market Research and Analysis in New Jersey: Agencies in New Jersey conduct market research and analysis to provide insights into market trends, customer behavior, and competitive landscapes, enabling businesses to make informed decisions.

7. Web Design and Development in New Jersey: These agencies also offer web design and development, ensuring businesses have a user-friendly, aesthetically pleasing, and functional online presence.

8. Advertising in New Jersey: Traditional and digital advertising, including TV, radio, print, and online ads, are key services provided by New Jersey marketing agencies, helping businesses reach broader audiences.

9. Email Marketing in New Jersey: Email marketing services, including newsletter creation, distribution, and performance tracking, are offered to engage existing and potential customers effectively.

10. SEO and SEM Services in New Jersey: Agencies in New Jersey provide search engine optimization (SEO) and search engine marketing (SEM) to improve website rankings and visibility on search engines like Google.

Each of these services is designed to cater to the unique business environment and diverse industries present in New Jersey.`
  },
  {
    question: 'How can I assess the level of expertise and experience of a digital marketing agency in New Jersey?',
    answer: `Assessing the level of expertise and experience of a digital marketing agency in New Jersey involves several key steps, each tailored to ensure you partner with an agency that can meet your specific needs:

1. Review Their Portfolio and Case Studies in New Jersey: Examine the agency's portfolio and case studies specific to New Jersey clients. This will give you insights into their experience with local markets and industries, and how they have addressed various digital marketing challenges.

2. Check Client Testimonials and References in New Jersey: Look for testimonials and references from other New Jersey-based businesses. Feedback from local clients can provide a clearer picture of the agency's regional expertise and client satisfaction levels.

3. Evaluate Their Experience with New Jersey Markets: Assess the agency's understanding of the New Jersey market. Agencies with experience in New Jersey will have a better grasp of local consumer behavior, regional trends, and specific marketing channels that work best in the state.

4. Inquire About Their Team's Qualifications and Specializations in New Jersey: Ask about the qualifications and specializations of their team, specifically regarding projects in New Jersey. Understanding the team's expertise in areas like SEO, social media, and content marketing within the New Jersey context can be valuable.

5. Analyze Their Digital Presence and Success in New Jersey: Look at the agency's own digital presence, including their website, social media, and search engine rankings, particularly in New Jersey. A strong online presence in the local market is often a good indicator of their capabilities.

6. Discuss Their Approach to New Jersey Specific Challenges: During consultations, discuss how they approach challenges and opportunities unique to New Jersey. Their strategies for local SEO, regional ad targeting, and understanding of New Jersey's diverse demographics can reveal their level of local expertise.

7. Check for Any Industry Awards or Recognitions in New Jersey: Look for any industry awards or recognitions they have received, especially those specific to their work in New Jersey. This can be an indicator of excellence and reputation in the local market.

8. Assess Their Use of Data and Analytics for New Jersey Campaigns: Evaluate how they utilize data and analytics in strategizing and measuring the success of campaigns, particularly those conducted in New Jersey. Proficiency in data analysis is crucial for effective digital marketing.

9. Ask About Their Experience with Industries Prevalent in New Jersey: Inquire about their experience with industries that are prevalent in New Jersey. Agencies familiar with key local industries like pharmaceuticals, finance, or technology may offer more tailored and effective strategies.

10. Determine Their Adaptability to New Jersey Market Changes: Understand how they adapt to changes in the New Jersey market. A capable agency should be agile and responsive to shifts in local market dynamics and digital marketing trends.

By carefully evaluating these aspects, you can gauge the level of expertise and experience a digital marketing agency has in the New Jersey market, ensuring a good fit for your specific needs.`
  },
  {
    question: 'What should I consider when comparing pricing between different digital marketing agencies in New Jersey?',
    answer: `When comparing pricing between different digital marketing agencies in New Jersey, it's important to consider several key factors to ensure you're making an informed decision:

1. Scope of Services in New Jersey: Evaluate the range of services offered by each agency in New Jersey. Some might offer comprehensive packages, including SEO, social media, and content marketing, while others might specialize in one area. The breadth and depth of services will impact pricing.

2. Agency's Expertise and Reputation in New Jersey: Consider the agency's expertise and reputation within New Jersey. Agencies with a strong track record and positive reviews in the state might charge more, but they often bring added value and reliability.

3. Customization of Services for New Jersey Markets: Look at how each agency customizes their services for the New Jersey market. Tailored strategies that consider local demographics, consumer behavior, and market trends might be more costly but can yield better results.

4. Long-Term ROI Versus Short-Term Costs in New Jersey: Balance the long-term return on investment (ROI) against short-term costs. An agency in New Jersey that offers a higher-priced strategy with a strong potential for ROI might be more beneficial than a less expensive but less effective option.

5. Contract Terms and Flexibility in New Jersey: Review the contract terms. Some New Jersey agencies might offer more flexible contracts or payment plans, which can influence the overall cost and your cash flow.

6. Level of Personalized Attention and Service in New Jersey: Assess the level of personalized attention and service you will receive from each agency in New Jersey. More customized and hands-on service might come at a premium but can be crucial for achieving your marketing goals.

7. Tools and Technology Used in New Jersey: Inquire about the tools and technology used by agencies in New Jersey. Advanced tools for data analytics, automation, and customer relationship management might increase costs but offer more effective marketing solutions.

8. Post-Campaign Support and Analysis in New Jersey: Consider the extent of post-campaign support and analysis offered. Comprehensive reporting and analysis in the context of the New Jersey market can be valuable for understanding campaign effectiveness and future planning.

9. Experience with Similar Businesses in New Jersey: Evaluate their experience working with businesses similar to yours in New Jersey. Agencies familiar with your industry and local market nuances can provide more targeted and effective strategies, which might affect pricing.

10. Transparency and Hidden Costs in New Jersey: Finally, ensure transparency in pricing. Be wary of any hidden costs or fees that might not be immediately apparent in the pricing structure of New Jersey agencies.

Taking these factors into account will help you compare pricing between digital marketing agencies in New Jersey more effectively, ensuring you choose an agency that offers the best value for your specific needs and budget.`
  },
  {
    question: 'What are the benefits of working with a local digital marketing agency in New Jersey?',
    answer: `Working with a local digital marketing agency in New Jersey offers several benefits, each tailored to the specific context of New Jersey's market and business environment:

1. Local Market Knowledge in New Jersey: A New Jersey-based agency will have in-depth knowledge of the local market, including consumer behaviors, preferences, and trends specific to New Jersey, which can be invaluable for targeted marketing strategies.

2. Understanding of New Jersey's Regulatory Environment: Agencies in New Jersey will be more familiar with state-specific regulations and compliance requirements, ensuring that your digital marketing strategies adhere to local legal standards.

3. Personalized, Face-to-Face Interaction in New Jersey: Working with a local agency in New Jersey allows for more personal interaction, including face-to-face meetings, which can enhance communication, understanding, and collaboration on your projects.

4. Networking and Local Connections in New Jersey: A New Jersey digital marketing agency may have established networks and connections within the state, which can be leveraged for partnerships, local media opportunities, and community engagement.

5. Quick Adaptation to New Jersey Market Changes: Being based in New Jersey, these agencies can quickly adapt to sudden market shifts or trends in the state, allowing for more agile and responsive marketing strategies.

6. Supporting the Local Economy in New Jersey: By partnering with a New Jersey agency, you're supporting the local economy, which can resonate positively with New Jersey customers who value community and local business support.

7. Cultural Alignment with New Jersey Audiences: A local agency will have a better grasp of the cultural nuances and specificities of New Jersey, which can be crucial for creating relatable and effective marketing campaigns.

8. Time Zone Alignment in New Jersey: Working in the same time zone simplifies coordination and communication, making the process more efficient and seamless for businesses based in New Jersey.

9. Tailored Strategies for New Jersey's Diverse Regions: New Jersey has diverse regions with different characteristics. Local agencies can tailor strategies that cater to the unique aspects of North Jersey, Central Jersey, and South Jersey markets.

10. Local SEO Optimization for New Jersey: A New Jersey-based digital marketing agency will have expertise in local SEO strategies that are crucial for businesses looking to rank higher in local search results within the New Jersey area.

Engaging with a local digital marketing agency in New Jersey can thus provide a more tailored, effective, and cohesive approach to your digital marketing efforts in the state.`
  },
  {
    question: 'What are some common mistakes to avoid when hiring a digital marketing agency in New Jersey?',
    answer: `When hiring a digital marketing agency in New Jersey, there are several common pitfalls you should be aware of to ensure a successful partnership:

1. Not Verifying Local New Jersey Experience: Overlooking to verify the agency's experience with the New Jersey market can lead to ineffective strategies. Ensure they have a proven track record in New Jersey.

2. Ignoring New Jersey Market-Specific Strategies: Hiring an agency that does not tailor strategies for the unique aspects of the New Jersey market, such as local SEO or region-specific content, can lead to less impactful campaigns.

3. Overlooking Agency's Understanding of New Jersey Regulations: Failing to ensure that the agency is knowledgeable about New Jersey's specific advertising and marketing regulations can lead to legal complications.

4. Not Assessing Cultural Fit with New Jersey Values: Not considering whether the agency aligns with the cultural and business values prevalent in New Jersey can result in a mismatch in work ethos and communication.

5. Underestimating the Importance of Local Networks in New Jersey: Neglecting the importance of an agency's local networks within New Jersey can mean missing out on valuable local insights, partnerships, and opportunities.

6. Assuming One-Size-Fits-All in Digital Marketing: Assuming that what works in other regions will work in New Jersey can be a mistake. The agency should understand the nuances of the New Jersey market.

7. Not Setting Clear Goals for New Jersey Market: Failing to set clear, measurable goals specific to your New Jersey audience with the agency can lead to directionless campaigns and wasted resources.

8. Overlooking Post-Campaign Analytics Specific to New Jersey: Not focusing on post-campaign analytics that specifically measure impact in New Jersey can prevent you from understanding the true effectiveness of your campaigns in the state.

9. Disregarding the Importance of Local SEO in New Jersey: Not prioritizing local SEO strategies for the New Jersey market can lead to missed opportunities in reaching a local audience effectively.

10. Neglecting Transparent Communication Practices: Underestimating the importance of transparent communication practices can lead to misunderstandings, especially when dealing with regional specifics in New Jersey.

Avoiding these mistakes will help ensure that the digital marketing agency you choose in New Jersey is well-equipped to meet your specific business needs and goals within the local context.`
  }
];

function NewJerseyFAQ({ faqs, stateName = "New Jersey" }: NewJerseyFAQProps) {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  // STRICT MODE: NO fallback to defaultFaqData
  // If faqs are empty or missing, return null (hide FAQ section)
  const faqData = faqs && faqs.length > 0 ? faqs : [];

  // Hide FAQ section if no valid FAQs
  if (faqData.length === 0) {
    console.warn(`⚠️ No FAQs available for ${stateName} - hiding FAQ section`);
    return null;
  }

  const toggleFaq = (index: number) => {
    setOpenIndex(openIndex === index ? null : index);
  };

  // FAQ schema is now generated by SEOTags component (unified @graph)
  // No need to generate it here to avoid duplication

  return (
    <section className="faq-section-nj">
      <div className="container">
        <div className="faq-nj-header">
          <h2 className="text-lg md:text-3xl font-bold leading-tight">Frequently Asked Questions About Marketing Agencies in {stateName}</h2>
          <p className="faq-nj-subtitle">
            Find quick answers about services, pricing, local expertise and what to look out for when hiring a digital marketing agency in {stateName}.
          </p>
        </div>

        <div className="faq-nj-content">
          <div className="faq-nj-list">
            {faqData.map((faq, index) => (
              <div key={index} className="faq-nj-item">
                <button
                  className="faq-nj-question"
                  onClick={() => toggleFaq(index)}
                  aria-expanded={openIndex === index}
                >
                  <span className="faq-nj-question-text text-sm md:text-base font-medium md:font-semibold text-left">{faq.question}</span>
                  <span className="faq-nj-icon" aria-hidden="true">
                    {openIndex === index ? '−' : '+'}
                  </span>
                </button>
                {/* CRITICAL: Answer ALWAYS rendered in DOM for SEO, hidden with CSS if collapsed */}
                <div
                  className="faq-nj-answer"
                  style={{ display: openIndex === index ? 'block' : 'none' }}
                >
                  <div className="faq-nj-answer-content">
                    {faq.answer}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}

export default NewJerseyFAQ;
