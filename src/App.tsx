import React from 'react'
import Message from './assets/Message'
import './App.css'
import mainImg from './mainimg.jpg'
import Navbar from './assets/Navbar'
import NavBottom from './assets/NavBottom'

function App(){
  return (
    
    <div >
      <Navbar />
      <NavBottom />
      <Message />
      <img src={mainImg} className='mainImg' alt=''></img>

    </div>
  )
}

export default App