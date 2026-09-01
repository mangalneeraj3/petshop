// Mobile Navigation Toggle
const hamburger = document.getElementById('hamburger');
const navLinks = document.querySelector('.nav-links');

hamburger.addEventListener('click', () => {
    navLinks.classList.toggle('active');
    const icon = hamburger.querySelector('i');
    if (navLinks.classList.contains('active')) {
        icon.classList.remove('fa-bars');
        icon.classList.add('fa-times');
    } else {
        icon.classList.remove('fa-times');
        icon.classList.add('fa-bars');
    }
});

// Close mobile menu when link is clicked
document.querySelectorAll('.nav-links a').forEach(link => {
    link.addEventListener('click', () => {
        navLinks.classList.remove('active');
        const icon = hamburger.querySelector('i');
        icon.classList.remove('fa-times');
        icon.classList.add('fa-bars');
    });
});

// Hero Slider
let slideIndex = 0;
const slides = document.querySelectorAll('.slide');

function showSlide(index) {
    if (slides.length === 0) return;
    
    slides.forEach(slide => {
        slide.classList.remove('active');
    });
    
    if (index >= slides.length) {
        slideIndex = 0;
    } else if (index < 0) {
        slideIndex = slides.length - 1;
    } else {
        slideIndex = index;
    }
    
    slides[slideIndex].classList.add('active');
}

function moveSlide(n) {
    showSlide(slideIndex + n);
}

// Auto slide every 5 seconds
if (slides.length > 0) {
    setInterval(() => {
        moveSlide(1);
    }, 5000);
}


// Cart Logic
let cartCount = 0;
function addToCart() {
    cartCount++;
    document.querySelector('.cart-count').textContent = cartCount;
    // Simple visual feedback
    const btn = event.target;
    const originalText = btn.textContent;
    btn.textContent = 'Added!';
    btn.style.backgroundColor = '#10B981';
    
    setTimeout(() => {
        btn.textContent = originalText;
        btn.style.backgroundColor = '';
    }, 2000);
}


// Modal Logic for Enquiries
const modal = document.getElementById('enquiryModal');
const modalPetName = document.getElementById('modalPetName');

function openModal(petName) {
    modalPetName.textContent = petName;
    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden'; // Prevent scrolling
}

function closeModal() {
    modal.style.display = 'none';
    document.body.style.overflow = 'auto'; // Re-enable scrolling
    document.getElementById('enquiryForm').reset();
    document.getElementById('enq-msg').textContent = '';
}

// Close modal when clicking outside of it
window.addEventListener('click', (event) => {
    if (event.target === modal) {
        closeModal();
    }
});

// Form Submissions
function handleEnquiry(e) {
    e.preventDefault();
    const name = document.getElementById('name').value;
    const phone = document.getElementById('phone').value;
    const message = document.getElementById('message').value;
    
    // Basic validation is handled by HTML5, here we just show success
    const msgEl = document.getElementById('enq-msg');
    
    if(name && phone && message) {
        msgEl.textContent = 'Sending enquiry...';
        msgEl.className = 'form-msg';
        
        // Simulate API call
        setTimeout(() => {
            msgEl.textContent = 'Thank you! We will contact you shortly.';
            msgEl.className = 'form-msg success-msg';
            
            setTimeout(() => {
                closeModal();
            }, 3000);
        }, 1500);
    }
    return false;
}

function handleNewsletter(e) {
    e.preventDefault();
    const email = document.getElementById('newsEmail').value;
    const msgEl = document.getElementById('news-msg');
    
    if(email) {
        msgEl.textContent = 'Subscribing...';
        
        // Simulate API call
        setTimeout(() => {
            msgEl.textContent = 'Successfully subscribed! Check your inbox for the discount code.';
            msgEl.className = 'form-msg success-msg';
            document.getElementById('newsletterForm').reset();
            
            setTimeout(() => {
                msgEl.textContent = '';
            }, 4000);
        }, 1500);
    }
    return false;
}

// Sticky Header Styling on Scroll
window.addEventListener('scroll', () => {
    const header = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        header.style.padding = '0.5rem 5%';
    } else {
        header.style.padding = '1rem 5%';
    }
});
