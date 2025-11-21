import React from 'react';
import './Contact.css';

const Contact = () => {
  return (
    <section id="contact" className="contact">
      <div className="container">
        <h2>Contact Us</h2>
        <div className="contact-content">
          <div className="contact-info">
            <div className="info-item">
              <h3>📍 Location</h3>
              <p>123 Gourmet Street<br />Culinary District, CD 12345</p>
            </div>
            <div className="info-item">
              <h3>📞 Phone</h3>
              <p>(555) 123-BITE</p>
            </div>
            <div className="info-item">
              <h3>🕒 Hours</h3>
              <p>Mon-Thu: 5PM-10PM<br />Fri-Sat: 5PM-11PM<br />Sun: 4PM-9PM</p>
            </div>
          </div>
          <div className="reservation-form">
            <h3>Make a Reservation</h3>
            <form>
              <input type="text" placeholder="Your Name" />
              <input type="email" placeholder="Email" />
              <input type="tel" placeholder="Phone" />
              <input type="date" />
              <select>
                <option>Party Size</option>
                <option>2 People</option>
                <option>4 People</option>
                <option>6+ People</option>
              </select>
              <button type="submit" className="btn btn-primary">Reserve Now</button>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Contact;