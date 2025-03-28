import { Request, Response } from "express";
import pool from "../models/db";
import bryct from "bcrypt";
import jwt from 'jsonwebtoken';
const ENCRYPT_NUM = 10;
const JWT_SECRET = process.env.JWT_SECRET || 'chatappsecret';

export const register = async(req: Request, res: Response) => {

        const {username, email, password} = req.body;
        try {
            const hashedPassword = await bryct.hash(password, ENCRYPT_NUM);
            const result = await pool.query(
                'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING *',
                [username, email, hashedPassword]
            );
            const user = result.rows[0];
            res.status(201).json({message:"User registered success", user});
    
        } catch (error){
            console.error("Error during registration:", error); // Log lỗi chi tiết
            res.status(500).json({ error: "Failed to sign up", details: error });
        }
};

export const login = async(req: Request, res: Response): Promise<any> => {
    const {email, password} = req.body;
    try{
        const result = await pool.query(
            'SELECT * FROM users WHERE email = $1',
            [email]
        );
        const user = result.rows[0];
        if(!user) return res.status(201).json({message:"No user"});

        const isRight = await bryct.compare(password, user.password);
        if(!isRight) return res.status(201).json({message:"Wrong"});
        const token = jwt.sign({id:user.id}, JWT_SECRET, {expiresIn:'1h'});
        res.json({message:"Log in success", token});
    } catch (error) {
        console.error("Error during Log in :", error); // Log lỗi chi tiết
        res.status(500).json({ error: "Failed to log in", details: error });

    }
};