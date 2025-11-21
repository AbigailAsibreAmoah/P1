import React from 'react';
import './About.css';

const About = () => {
  return (
    <section id="about" className="about">
      <div className="container">
        <div className="about-content">
          <h2>About Tasty Bites</h2>
          <p>Since 2010, Tasty Bites has been serving exceptional cuisine with a passion for quality and innovation. Our chefs combine traditional techniques with modern creativity to deliver unforgettable dining experiences.</p>
          <div className="features">
            <div className="feature">
              <h3>🌟 Premium Quality</h3>
              <p>Fresh, locally sourced ingredients</p>
            </div>
            <div className="feature">
              <h3>👨‍🍳 Expert Chefs</h3>
              <p>Award-winning culinary team</p>
            </div>
            <div className="feature">
              <h3>🏆 Excellence</h3>
              <p>Consistently rated 5 stars</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default About;