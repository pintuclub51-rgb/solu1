```jsx
import React, { useState, useRef, useEffect } from 'react';
import { motion, useScroll, useTransform } from 'framer-motion';
import { Phone, MessageCircle, Calendar, Zap, BarChart3, Users, CreditCard, Eye, Instagram, Facebook, ArrowDown, Send, Search, Globe, Shield, TrendingUp } from 'lucide-react';

const App = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const contactFormRef = useRef(null);
  const { scrollYProgress } = useScroll();
  const opacity = useTransform(scrollYProgress, [0, 0.2], [1, 0]);

  const scrollToContact = () => {
    contactFormRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  const features = [
    {
      icon: <Zap className="w-8 h-8" />,
      title: "AI Business Automation",
      description: "Streamline operations with intelligent automation that learns and adapts to your business needs."
    },
    {
      icon: <BarChart3 className="w-8 h-8" />,
      title: "Marketing Dashboard",
      description: "Comprehensive analytics and campaign management in one intuitive interface."
    },
    {
      icon: <Users className="w-8 h-8" />,
      title: "Client & Lead Management",
      description: "Track, nurture, and convert leads with our advanced CRM system."
    },
    {
      icon: <CreditCard className="w-8 h-8" />,
      title: "Payment Integration",
      description: "Seamless payment processing with multiple gateway support."
    },
    {
      icon: <Eye className="w-8 h-8" />,
      title: "Real-Time Analytics",
      description: "Monitor performance and make data-driven decisions instantly."
    }
  ];

  const testimonials = [
    {
      name: "Sarah Johnson",
      role: "CEO, TechStart Inc.",
      content: "SoluGrow transformed our business operations. The AI automation saved us 40% in operational costs!",
      avatar: "https://placehold.co/60x60/00C6FF/FFFFFF?text=SJ"
    },
    {
      name: "Michael Chen",
      role: "Marketing Director",
      content: "The marketing dashboard is incredible. We've doubled our conversion rates in just 3 months.",
      avatar: "https://placehold.co/60x60/6B00FF/FFFFFF?text=MC"
    },
    {
      name: "Emma Rodriguez",
      role: "Small Business Owner",
      content: "Perfect solution for growing businesses. Easy to use and incredibly powerful.",
      avatar: "https://placehold.co/60x60/00C6FF/FFFFFF?text=ER"
    }
  ];

  const seoFeatures = [
    {
      icon: <Search className="w-6 h-6" />,
      title: "SEO Optimization",
      description: "Built-in SEO tools to help your website rank higher on Google search results."
    },
    {
      icon: <Globe className="w-6 h-6" />,
      title: "Google Indexing",
      description: "Optimized for Google's crawler to ensure your site appears in search results quickly."
    },
    {
      icon: <Shield className="w-6 h-6" />,
      title: "Fast Loading",
      description: "Lightning-fast performance that Google loves, improving your search rankings."
    },
    {
      icon: <TrendingUp className="w-6 h-6" />,
      title: "Analytics Ready",
      description: "Integrated with Google Analytics to track your SEO performance and traffic."
    }
  ];

  const handleSubmit = (e) => {
    e.preventDefault();
    alert('Thank you for your message! We will contact you soon.');
    e.target.reset();
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-900 via-black to-gray-950 text-white overflow-x-hidden">
      {/* SEO Meta Tags - These help with Google search visibility */}
      {/* Note: In a real React app, these would be in the HTML head, but for this component demonstration, we're showing the SEO-focused content */}

      {/* Animated Background Elements */}
      <div className="fixed inset-0 z-0">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,rgba(0,198,255,0.1),transparent_50%)]"></div>
        <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-gradient-to-r from-blue-500/10 to-violet-500/10 rounded-full blur-3xl animate-pulse"></div>
        <div className="absolute bottom-1/4 right-1/4 w-80 h-80 bg-gradient-to-l from-violet-500/10 to-blue-500/10 rounded-full blur-3xl animate-pulse delay-1000"></div>
      </div>

      {/* Navigation */}
      <nav className="relative z-50 px-6 py-4 backdrop-blur-lg bg-black/20 border-b border-blue-500/20">
        <div className="max-w-7xl mx-auto flex justify-between items-center">
          <motion.div 
            className="text-2xl font-bold bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent"
            whileHover={{ scale: 1.05 }}
          >
            SoluGrow
          </motion.div>
          <div className="hidden md:flex space-x-6">
            <a href="#features" className="hover:text-blue-400 transition-colors">Features</a>
            <a href="#seo" className="hover:text-violet-400 transition-colors">SEO</a>
            <a href="#testimonials" className="hover:text-blue-400 transition-colors">Testimonials</a>
            <a href="#contact" className="hover:text-violet-400 transition-colors">Contact</a>
          </div>
          <button 
            className="md:hidden"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            <div className="w-6 h-6 flex flex-col justify-center space-y-1">
              <div className="w-full h-0.5 bg-white"></div>
              <div className="w-full h-0.5 bg-white"></div>
              <div className="w-full h-0.5 bg-white"></div>
            </div>
          </button>
        </div>
        {isMenuOpen && (
          <motion.div 
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            className="md:hidden mt-4 pb-4 space-y-4"
          >
            <a href="#features" className="block hover:text-blue-400 transition-colors">Features</a>
            <a href="#seo" className="block hover:text-violet-400 transition-colors">SEO Features</a>
            <a href="#testimonials" className="block hover:text-blue-400 transition-colors">Testimonials</a>
            <a href="#contact" className="block hover:text-violet-400 transition-colors">Contact</a>
          </motion.div>
        )}
      </nav>

      {/* Hero Section */}
      <section className="relative z-10 px-6 py-20 md:py-32">
        <div className="max-w-7xl mx-auto text-center">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            className="mb-8"
          >
            <h1 className="text-4xl md:text-6xl lg:text-7xl font-bold mb-6 leading-tight">
              Automate.{' '}
              <span className="bg-gradient-to-r from-blue-400 via-violet-400 to-blue-400 bg-clip-text text-transparent">
                Grow.
              </span>{' '}
              Succeed with SoluGrow.
            </h1>
            <p className="text-xl md:text-2xl text-gray-300 max-w-4xl mx-auto leading-relaxed">
              Empower your business with next-gen AI automation, client management, and smart marketing tools — all in one platform.
            </p>
          </motion.div>

          {/* Hero Buttons */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="flex flex-col sm:flex-row gap-4 justify-center items-center mb-16"
          >
            <motion.a
              href="tel:+918440809115"
              className="px-8 py-4 bg-gradient-to-r from-blue-600 to-blue-800 rounded-full font-semibold flex items-center gap-2 shadow-lg shadow-blue-500/25 hover:shadow-blue-500/40 transition-all duration-300"
              whileHover={{ scale: 1.05, boxShadow: "0 0 30px rgba(0, 198, 255, 0.4)" }}
              whileTap={{ scale: 0.95 }}
            >
              <Phone className="w-5 h-5" />
              Call Us
            </motion.a>
            <motion.a
              href="https://wa.me/918440809115"
              target="_blank"
              rel="noopener noreferrer"
              className="px-8 py-4 bg-gradient-to-r from-green-600 to-green-800 rounded-full font-semibold flex items-center gap-2 shadow-lg shadow-green-500/25 hover:shadow-green-500/40 transition-all duration-300"
              whileHover={{ scale: 1.05, boxShadow: "0 0 30px rgba(72, 187, 120, 0.4)" }}
              whileTap={{ scale: 0.95 }}
            >
              <MessageCircle className="w-5 h-5" />
              WhatsApp Chat
            </motion.a>
            <motion.button
              onClick={scrollToContact}
              className="px-8 py-4 bg-gradient-to-r from-violet-600 to-violet-800 rounded-full font-semibold flex items-center gap-2 shadow-lg shadow-violet-500/25 hover:shadow-violet-500/40 transition-all duration-300"
              whileHover={{ scale: 1.05, boxShadow: "0 0 30px rgba(107, 0, 255, 0.4)" }}
              whileTap={{ scale: 0.95 }}
            >
              <Calendar className="w-5 h-5" />
              Book Free Demo
            </motion.button>
          </motion.div>

          {/* Hologram Globe Placeholder */}
          <motion.div
            initial={{ opacity: 0, scale: 0.8 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 1, delay: 0.4 }}
            className="relative mx-auto w-64 h-64 md:w-80 md:h-80 rounded-full bg-gradient-to-br from-blue-500/20 to-violet-500/20 border border-blue-500/30 flex items-center justify-center overflow-hidden"
          >
            <div className="absolute inset-4 rounded-full bg-gradient-to-br from-blue-600/10 to-violet-600/10 animate-spin-slow"></div>
            <div className="absolute inset-8 rounded-full bg-gradient-to-br from-blue-700/10 to-violet-700/10 animate-spin-reverse"></div>
            <div className="w-32 h-32 rounded-full bg-gradient-to-br from-blue-400/30 to-violet-400/30 flex items-center justify-center">
              <div className="w-16 h-16 rounded-full bg-gradient-to-br from-blue-300/40 to-violet-300/40"></div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* SEO Section - New Section Added */}
      <section id="seo" className="relative z-10 px-6 py-20 bg-black/20">
        <div className="max-w-7xl mx-auto">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl md:text-5xl font-bold mb-6">
              Built for{' '}
              <span className="bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent">
                Google Search Success
              </span>
            </h2>
            <p className="text-xl text-gray-300 max-w-3xl mx-auto">
              Your website will be optimized to rank higher on Google and appear in search results quickly.
            </p>
          </motion.div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {seoFeatures.map((feature, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: index * 0.1 }}
                whileHover={{ 
                  y: -10,
                  boxShadow: "0 20px 40px rgba(0, 198, 255, 0.2), 0 0 30px rgba(107, 0, 255, 0.2)"
                }}
                className="backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-6 hover:border-blue-500/40 transition-all duration-300 text-center"
              >
                <div className="w-16 h-16 bg-gradient-to-r from-blue-500 to-violet-500 rounded-xl flex items-center justify-center mx-auto mb-4 shadow-lg shadow-blue-500/25">
                  {feature.icon}
                </div>
                <h3 className="text-xl font-bold mb-3">{feature.title}</h3>
                <p className="text-gray-300 text-sm leading-relaxed">{feature.description}</p>
              </motion.div>
            ))}
          </div>

          {/* SEO Benefits List */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="mt-16 backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-8"
          >
            <h3 className="text-2xl font-bold mb-6 text-center">Why Google Loves SoluGrow Websites</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-300">
              <div className="flex items-start gap-3">
                <div className="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
                <span>Fast loading speed (under 2 seconds) - Google's #1 ranking factor</span>
              </div>
              <div className="flex items-start gap-3">
                <div className="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
                <span>Mobile-responsive design - essential for Google's mobile-first indexing</span>
              </div>
              <div className="flex items-start gap-3">
                <div className="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
                <span>Clean, semantic HTML structure that Google crawlers can easily understand</span>
              </div>
              <div className="flex items-start gap-3">
                <div className="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
                <span>Built-in schema markup for better rich snippets in search results</span>
              </div>
              <div className="flex items-start gap-3">
                <div className="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
                <span>Automatic XML sitemap generation for faster Google indexing</span>
              </div>
              <div className="flex items-start gap-3">
                <div className="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
                <span>Optimized image compression without quality loss</span>
              </div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="relative z-10 px-6 py-20">
        <div className="max-w-7xl mx-auto">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl md:text-5xl font-bold mb-6">
              Powerful Features for{' '}
              <span className="bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent">
                Business Growth
              </span>
            </h2>
            <p className="text-xl text-gray-300 max-w-3xl mx-auto">
              Everything you need to automate, analyze, and accelerate your business success.
            </p>
          </motion.div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-8">
            {features.map((feature, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: index * 0.1 }}
                whileHover={{ 
                  y: -10,
                  boxShadow: "0 20px 40px rgba(0, 198, 255, 0.2), 0 0 30px rgba(107, 0, 255, 0.2)"
                }}
                className="backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-6 hover:border-blue-500/40 transition-all duration-300"
              >
                <div className="w-16 h-16 bg-gradient-to-r from-blue-500 to-violet-500 rounded-xl flex items-center justify-center mb-4 shadow-lg shadow-blue-500/25">
                  {feature.icon}
                </div>
                <h3 className="text-xl font-bold mb-3">{feature.title}</h3>
                <p className="text-gray-300 text-sm leading-relaxed">{feature.description}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
      <section id="testimonials" className="relative z-10 px-6 py-20">
        <div className="max-w-7xl mx-auto">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl md:text-5xl font-bold mb-6">
              What Our{' '}
              <span className="bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent">
                Clients Say
              </span>
            </h2>
          </motion.div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {testimonials.map((testimonial, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                whileHover={{ 
                  scale: 1.05,
                  boxShadow: "0 20px 40px rgba(0, 198, 255, 0.3), 0 0 30px rgba(107, 0, 255, 0.3)"
                }}
                className="backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-6 hover:border-blue-500/40 transition-all duration-300"
              >
                <div className="flex items-center mb-4">
                  <img 
                    src={testimonial.avatar} 
                    alt={testimonial.name}
                    className="w-12 h-12 rounded-full mr-4"
                  />
                  <div>
                    <h4 className="font-bold">{testimonial.name}</h4>
                    <p className="text-sm text-gray-400">{testimonial.role}</p>
                  </div>
                </div>
                <p className="text-gray-300 italic">"{testimonial.content}"</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section id="contact" ref={contactFormRef} className="relative z-10 px-6 py-20">
        <div className="max-w-7xl mx-auto">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl md:text-5xl font-bold mb-6">
              Let's{' '}
              <span className="bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent">
                Automate Your Business
              </span>
            </h2>
          </motion.div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
            {/* Contact Form */}
            <motion.div
              initial={{ opacity: 0, x: -30 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              className="backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-8"
            >
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium mb-2">Name</label>
                    <input
                      type="text"
                      required
                      className="w-full px-4 py-3 bg-black/50 border border-blue-500/30 rounded-lg focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20 transition-all"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Email</label>
                    <input
                      type="email"
                      required
                      className="w-full px-4 py-3 bg-black/50 border border-blue-500/30 rounded-lg focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20 transition-all"
                    />
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium mb-2">Phone</label>
                  <input
                    type="tel"
                    required
                    className="w-full px-4 py-3 bg-black/50 border border-blue-500/30 rounded-lg focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20 transition-all"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium mb-2">Message</label>
                  <textarea
                    rows={4}
                    required
                    className="w-full px-4 py-3 bg-black/50 border border-blue-500/30 rounded-lg focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20 transition-all resize-none"
                  ></textarea>
                </div>
                <motion.button
                  type="submit"
                  className="w-full px-8 py-4 bg-gradient-to-r from-blue-600 to-violet-600 rounded-lg font-semibold shadow-lg shadow-blue-500/25 hover:shadow-blue-500/40 transition-all duration-300"
                  whileHover={{ scale: 1.02, boxShadow: "0 0 30px rgba(0, 198, 255, 0.4)" }}
                  whileTap={{ scale: 0.98 }}
                >
                  <Send className="w-5 h-5 inline mr-2" />
                  Send Message
                </motion.button>
              </form>
            </motion.div>

            {/* Contact Details */}
            <motion.div
              initial={{ opacity: 0, x: 30 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              className="space-y-8"
            >
              <div className="backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-8">
                <h3 className="text-2xl font-bold mb-6">Contact Details</h3>
                <div className="space-y-4">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-gradient-to-r from-blue-500 to-violet-500 rounded-lg flex items-center justify-center">
                      <div className="w-2 h-2 bg-white rounded-full"></div>
                    </div>
                    <span className="text-gray-300">📍 Agra, India</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-gradient-to-r from-blue-500 to-violet-500 rounded-lg flex items-center justify-center">
                      <Phone className="w-4 h-4" />
                    </div>
                    <a href="tel:+918440809115" className="text-gray-300 hover:text-blue-400 transition-colors">
                      +91 8440809115
                    </a>
                  </div>
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-gradient-to-r from-blue-500 to-violet-500 rounded-lg flex items-center justify-center">
                      <MessageCircle className="w-4 h-4" />
                    </div>
                    <a href="mailto:contact@solugrow.com" className="text-gray-300 hover:text-blue-400 transition-colors">
                      contact@solugrow.com
                    </a>
                  </div>
                </div>
              </div>

              {/* Social Links */}
              <div className="backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-8">
                <h3 className="text-2xl font-bold mb-6">Connect With Us</h3>
                <div className="grid grid-cols-2 gap-4">
                  <motion.a
                    href="https://www.instagram.com/solugrow"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-center gap-2 px-4 py-3 bg-gradient-to-r from-pink-600 to-pink-800 rounded-lg font-semibold hover:shadow-lg hover:shadow-pink-500/30 transition-all"
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                  >
                    <Instagram className="w-5 h-5" />
                    Instagram
                  </motion.a>
                  <motion.a
                    href="https://www.facebook.com/share/1Gggz2W5pc/?mibextid=wwXIfr"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-center gap-2 px-4 py-3 bg-gradient-to-r from-blue-600 to-blue-800 rounded-lg font-semibold hover:shadow-lg hover:shadow-blue-500/30 transition-all"
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                  >
                    <Facebook className="w-5 h-5" />
                    Facebook
                  </motion.a>
                  <motion.a
                    href="https://wa.me/918440809115"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-center gap-2 px-4 py-3 bg-gradient-to-r from-green-600 to-green-800 rounded-lg font-semibold hover:shadow-lg hover:shadow-green-500/30 transition-all"
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                  >
                    <MessageCircle className="w-5 h-5" />
                    WhatsApp
                  </motion.a>
                  <motion.a
                    href="tel:+918440809115"
                    className="flex items-center justify-center gap-2 px-4 py-3 bg-gradient-to-r from-blue-600 to-blue-800 rounded-lg font-semibold hover:shadow-lg hover:shadow-blue-500/30 transition-all"
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                  >
                    <Phone className="w-5 h-5" />
                    Call Now
                  </motion.a>
                </div>
              </div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="relative z-10 px-6 py-20">
        <div className="max-w-4xl mx-auto text-center">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="backdrop-blur-lg bg-black/30 border border-blue-500/20 rounded-2xl p-12"
          >
            <h2 className="text-3xl md:text-4xl font-bold mb-6">
              Ready to{' '}
              <span className="bg-gradient-to-r from-blue-400 to-violet-400 bg-clip-text text-transparent">
                Grow Smarter with AI?
              </span>
            </h2>
            <motion.button
              onClick={scrollToContact}
              className="px-8 py-4 bg-gradient-to-r from-blue-600 to-violet-600 rounded-full font-semibold text-lg shadow-lg shadow-blue-500/25 hover:shadow-blue-500/40 transition-all duration-300 flex items-center gap-2 mx-auto"
              whileHover={{ scale: 1.05, boxShadow: "0 0 30px rgba(0, 198, 255, 0.4)" }}
              whileTap={{ scale: 0.95 }}
            >
              Start Your Growth Now
              <ArrowDown className="w-5 h-5" />
            </motion.button>
          </motion.div>
        </div>
      </section>

      {/* Footer */}
      <footer className="relative z-10 px-6 py-8 border-t border-blue-500/20">
        <div className="max-w-7xl mx-auto text-center">
          <div className="flex justify-center space-x-6 mb-4">
            <a href="https://www.instagram.com/solugrow" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-blue-400 transition-colors">
              <Instagram className="w-5 h-5" />
            </a>
            <a href="https://www.facebook.com/share/1Gggz2W5pc/?mibextid=wwXIfr" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-blue-400 transition-colors">
              <Facebook className="w-5 h-5" />
            </a>
            <a href="https://wa.me/918440809115" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-blue-400 transition-colors">
              <MessageCircle className="w-5 h-5" />
            </a>
            <a href="tel:+918440809115" className="text-gray-400 hover:text-blue-400 transition-colors">
              <Phone className="w-5 h-5" />
            </a>
          </div>
          <p className="text-gray-500">
            © 2025 SoluGrow. All Rights Reserved.
          </p>
        </div>
      </footer>

      <style jsx>{`
        @keyframes spin-slow {
          from { transform: rotate(0deg); }
          to { transform: rotate(360deg); }
        }
        @keyframes spin-reverse {
          from { transform: rotate(360deg); }
          to { transform: rotate(0deg); }
        }
        .animate-spin-slow {
          animation: spin-slow 20s linear infinite;
        }
        .animate-spin-reverse {
          animation: spin-reverse 15s linear infinite;
        }
      `}</style>
    </div>
  );
};

export default App;
```
