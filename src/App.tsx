import React from 'react'
import Message from './assets/Message'
import './App.css'
import mainImg from './mainimg.jpg'

function App(){
  return (
    
    <div >
      <Message />
      <img src={mainImg} className='mainImg' alt=''></img>

    </div>
  )
}

export default App