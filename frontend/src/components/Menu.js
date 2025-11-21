import React from 'react';
import './Menu.css';

const Menu = () => {
  const menuItems = [
    { name: 'Grilled Salmon', price: '$28', description: 'Fresh Atlantic salmon with herbs' },
    { name: 'Beef Tenderloin', price: '$35', description: 'Premium cut with seasonal vegetables' },
    { name: 'Pasta Primavera', price: '$22', description: 'House-made pasta with fresh vegetables' },
    { name: 'Chocolate Soufflé', price: '$12', description: 'Decadent dessert with vanilla ice cream' }
  ];

  return (
    <section id="menu" className="menu">
      <div className="container">
        <h2>Our Menu</h2>
        <div className="menu-grid">
          {menuItems.map((item, index) => (
            <div key={index} className="menu-item">
              <div className="item-header">
                <h3>{item.name}</h3>
                <span className="price">{item.price}</span>
              </div>
              <p>{item.description}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Menu;