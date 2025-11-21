import React from 'react';
import './Hero.css';

const Hero = () => {
  return (
    <section id="home" className="hero">
      <div className="container">
        <div className="hero-content">
          <h1>Welcome to Tasty Bites</h1>
          <p>Experience culinary excellence with our carefully crafted dishes made from the finest ingredients</p>
          <div className="hero-buttons">
            <a href="#menu" className="btn btn-primary">View Menu</a>
            <a href="#contact" className="btn btn-secondary">Reserve Table</a>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;