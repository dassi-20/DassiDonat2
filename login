import React, { useRef, useState } from 'react';
import { connect } from 'react-redux';
import { setCurrentUser } from './redux/actions'
import { useHistory } from 'react-router-dom';

function mapStateToProps(state) {
    return {
        currentUser: state.currentUser,
        usersList: state.users
    }
}
function mapDispatchToProps(dispatch) {
    return {
        setUser: (user) => { dispatch(setCurrentUser(user)) }
    }
}


export default connect(mapStateToProps, mapDispatchToProps)(function Login(props) {

    const nameRef = useRef(null)
    const passwordRef = useRef(null)
    const { usersList, currentUser, setUser } = props
    const history = useHistory()

    function loginUser() {
        let user
        // usersList.forEach(user => {
        //  flag=  user.password==passwordRef.current.value;
        //     console.log(user.password);
        // });
        user = usersList.filter((item) => item.password == passwordRef.current.value)
        console.log(user);
        if (user.length) {
            console.log(user)
            setUser(user[0])
            history.push('/display')
        }

        else {
            history.push('/register')
        }
    }
    return (
        <>
            <input placeholder="enter userName" ref={nameRef} />
            <br></br>
            <input placeholder="enter password" ref={passwordRef} />
            <button onClick={() => { loginUser() }}>login</button>
        </>
    )
})
