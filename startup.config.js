module.exports = {
  apps: [
    {
      name: "codezilla-service",
      script: "bundle",
      args: "exec puma -C config/puma.rb",
      interpreter: "ruby",
      cwd: "/srv/app",
      instance_var: "INSTANCE_ID",
      env: {
        RAILS_ENV: "production",
      },
    },
  ],
};
